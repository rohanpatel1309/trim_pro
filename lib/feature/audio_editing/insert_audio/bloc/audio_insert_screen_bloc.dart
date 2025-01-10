import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/insert_audio/bloc/bloc_state_model/audio_insert_bloc_state_model.dart';

part 'audio_insert_screen_event.dart';

part 'audio_insert_screen_state.dart';

@injectable
class AudioInsertScreenBloc
    extends Bloc<AudioInsertScreenEvent, AudioInsertScreenState> {
  AudioInsertBlocStateModel audioInsertBlocStateModel =
      const AudioInsertBlocStateModel();
  late Duration totalDuration;
  late String filePath;

  AudioInsertScreenBloc()
      : super(const AudioInsertScreenState(
            audioInsertBlocStateModel: AudioInsertBlocStateModel())) {
    on<PickFile>(_onPickFile);
    on<InsertAudio>(_onInsertAudio);
    on<SetFileParameters>(_onSetFileParameters);
  }

  /// Pick file
  Future<void> _onPickFile(
      PickFile event, Emitter<AudioInsertScreenState> emit) async {
    audioInsertBlocStateModel =
        audioInsertBlocStateModel.copyWith(isLoading: true);
    emit(AudioInsertScreenState(
        audioInsertBlocStateModel: audioInsertBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if (fileResult != null) {
      audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(
          isLoading: false, fileUrl: fileResult.files.single.path!);

      emit(AudioInsertScreenState(
          audioInsertBlocStateModel: audioInsertBlocStateModel));
    } else {
      audioInsertBlocStateModel =
          audioInsertBlocStateModel.copyWith(isLoading: false);
      emit(Error(
          error: "Please Select File",
          timeStamp: DateTime.now(),
          audioInsertBlocStateModel: audioInsertBlocStateModel));
      emit(AudioInsertScreenState(
          audioInsertBlocStateModel: audioInsertBlocStateModel));
    }
  }

  /// Insert audio at a specific position
  Future<void> _onInsertAudio(
      InsertAudio event, Emitter<AudioInsertScreenState> emit) async {
    try {
      if (audioInsertBlocStateModel.fileUrl.isEmpty) {
        emit(Error(
            error: "Please select a file",
            timeStamp: DateTime.now(),
            audioInsertBlocStateModel: audioInsertBlocStateModel));
        return;
      }

      final (isValid, message) = validate(insertAt: event.insertAt);
      if (!isValid) {
        emit(Error(
            error: message,
            timeStamp: DateTime.now(),
            audioInsertBlocStateModel: audioInsertBlocStateModel));
        return;
      }

      audioInsertBlocStateModel =
          audioInsertBlocStateModel.copyWith(isLoading: true);
      emit(AudioInsertScreenState(
          audioInsertBlocStateModel: audioInsertBlocStateModel));

      final tempDir = await getTemporaryDirectory();
      const extension = "mp3";
      final tempFilePath = '${tempDir.path}/insert_audio_temp.$extension';

      // Clean up any leftover temporary files from previous operations
      final tempFile = File(tempFilePath);
      if (await tempFile.exists()) {
        await tempFile.delete();
      }

      String part1Path = '${tempDir.path}/f1_part1.$extension';
      final part1File = File(part1Path);
      if (await part1File.exists()) {
        await part1File.delete();
      }

      String part2Path = '${tempDir.path}/f1_part2.$extension';
      final part2File = File(part2Path);
      if (await part2File.exists()) {
        await part2File.delete();
      }

      // Paths to the original files (F1 and F2)
      String f1Path = filePath; // F1 file path
      String f2Path =
          audioInsertBlocStateModel.fileUrl; // F2 file path (file to insert)

      // Step 1: Convert F1 and F2 to MP3
      String f1Mp3Path = '${tempDir.path}/f1_converted.mp3';
      final f1Mp3File = File(f1Mp3Path);

      if (await f1Mp3File.exists()) {
        await f1Mp3File.delete();
      }

      String f2Mp3Path = '${tempDir.path}/f2_converted.mp3';

      final f2Mp3File = File(f1Mp3Path);

      if (await f2Mp3File.exists()) {
        await f2Mp3File.delete();
      }

      await FFmpegKit.execute("-i $f1Path -vn -acodec libmp3lame $f1Mp3Path");
      await FFmpegKit.execute("-i $f2Path -vn -acodec libmp3lame $f2Mp3Path");

      // Step 2: Trim F1 before the insertion point (0 to insertAt)
      await FFmpegKit.execute(
          "-i $f1Mp3Path -ss 0 -to ${event.insertAt} -c copy $part1Path");

      // Step 3: Trim F1 after the insertion point (insertAt to the end)
      await FFmpegKit.execute(
          "-i $f1Mp3Path -ss ${event.insertAt} -c copy $part2Path");

      // Step 4: Create a concat file for proper concatenation
      final concatFilePath = '${tempDir.path}/concat_list.txt';
      final concatFile = File(concatFilePath);
      await concatFile.writeAsString(
          "file '$part1Path'\nfile '$f2Mp3Path'\nfile '$part2Path'\n");

      // Step 5: Concatenate Part 1, F2, and Part 2 using concat demuxer
      String command =
          "-f concat -safe 0 -i $concatFilePath -c copy $tempFilePath";

      print('FFmpeg Command: $command');
      final session = await FFmpegKit.execute(command);
      //
      // final logs = await session.getLogs();
      // logs.forEach((log) => print(log.getMessage()));

      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        final savedFilePath = await CommonMethods.saveFile(
          fileName: "inserted_audio.$extension",
          filePath: tempFilePath,
        );

        if (savedFilePath != null) {
          // Delete temporary files after saving
          if (await tempFile.exists()) {
            await tempFile.delete();
          }

          if (await part1File.exists()) {
            await part1File.delete();
          }

          if (await part2File.exists()) {
            await part2File.delete();
          }

          if (await f1Mp3File.exists()) {
            await f1Mp3File.delete();
          }

          if (await f2Mp3File.exists()) {
            await f2Mp3File.delete();
          }

          audioInsertBlocStateModel =
              audioInsertBlocStateModel.copyWith(isLoading: false);
          emit(const Completed());
        } else {
          audioInsertBlocStateModel =
              audioInsertBlocStateModel.copyWith(isLoading: false);
          emit(Error(
              error: "File is not saved",
              timeStamp: DateTime.now(),
              audioInsertBlocStateModel: audioInsertBlocStateModel));
        }
      } else {
        final errorMessage = await session.getFailStackTrace();
        print("FFmpeg Error: $errorMessage");
        audioInsertBlocStateModel =
            audioInsertBlocStateModel.copyWith(isLoading: false);
        emit(Error(
            error: "FFmpeg Error: $errorMessage",
            timeStamp: DateTime.now(),
            audioInsertBlocStateModel: audioInsertBlocStateModel));
      }
    } catch (e, stackTrace) {
      audioInsertBlocStateModel =
          audioInsertBlocStateModel.copyWith(isLoading: false);
      print('Error: $e, StackTrace: $stackTrace');
      emit(Error(
          error: "An unexpected error occurred: $e",
          timeStamp: DateTime.now(),
          audioInsertBlocStateModel: audioInsertBlocStateModel));
    }
  }

  /// Validate duration
  (bool, String) validate({
    required String insertAt,
  }) {
    try {
      final position = CommonMethods.parseDuration(insertAt);

      if (position < Duration.zero || position > totalDuration) {
        return (false, "Duration is out of range.");
      }

      return (true, "");
    } catch (e) {
      return (false, "$e");
    }
  }

  /// Set file parameter
  void _onSetFileParameters(
      SetFileParameters event, Emitter<AudioInsertScreenState> emit) {
    totalDuration = event.totalDuration;
    filePath = event.filePath;
  }

  /// Format time
  int formatTimeToMilliseconds(String hhmmss) {
    final parts = hhmmss.split(':').map(int.parse).toList();
    final hours = parts[0];
    final minutes = parts[1];
    final seconds = parts[2];
    return ((hours * 3600 + minutes * 60 + seconds) * 1000);
  }
}
