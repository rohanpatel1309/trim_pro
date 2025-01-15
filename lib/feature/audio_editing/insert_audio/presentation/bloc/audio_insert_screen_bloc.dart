import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';

import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/insert_audio/presentation/bloc/bloc_state_model/audio_insert_bloc_state_model.dart';

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
          audioInsertBlocStateModel: audioInsertBlocStateModel,
        ));
        return;
      }

      // Validate insert position
      final (isValid, message) = validate(insertAt: event.insertAt);
      if (!isValid) {
        emit(Error(
          error: message,
          timeStamp: DateTime.now(),
          audioInsertBlocStateModel: audioInsertBlocStateModel,
        ));
        return;
      }

      // Update loading state
      audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: true);
      emit(AudioInsertScreenState(audioInsertBlocStateModel: audioInsertBlocStateModel));

      // Paths setup
      final Directory tempDir = await getTemporaryDirectory();
      const String extension = "mp3";
      final String tempFilePath = '${tempDir.path}/insert_audio_temp.$extension';

      await CommonMethods.cleanupTempFiles();

      // Paths to source files
      final String f1Path = '"$filePath"'; // Wrap in quotes for FFmpeg
      final String f2Path = '"${audioInsertBlocStateModel.fileUrl}"';

      // Step 1: Convert F1 and F2 to MP3
      final String f1Mp3Path = '"${tempDir.path}/f1_converted.mp3"';
      final String f2Mp3Path = '"${tempDir.path}/f2_converted.mp3"';

      await FFmpegKit.execute('-i $f1Path -vn -acodec libmp3lame $f1Mp3Path');
      await FFmpegKit.execute('-i $f2Path -vn -acodec libmp3lame $f2Mp3Path');

      // Step 2: Trim F1 (before and after insertion point)
      final String part1Path = '"${tempDir.path}/f1_part1.$extension"';
      final String part2Path = '"${tempDir.path}/f1_part2.$extension"';

      await FFmpegKit.execute('-i $f1Mp3Path -ss 0 -to ${event.insertAt} -c copy $part1Path');
      await FFmpegKit.execute('-i $f1Mp3Path -ss ${event.insertAt} -c copy $part2Path');

      // Step 3: Concatenate files
      final String concatFilePath = '"${tempDir.path}/concat_list.txt"';
      final File concatFile = File(concatFilePath.replaceAll('"', ''));
      await concatFile.writeAsString(
        "file ${part1Path.replaceAll('"', '')}\n"
            "file ${f2Mp3Path.replaceAll('"', '')}\n"
            "file ${part2Path.replaceAll('"', '')}\n",
      );

      // Final concatenation
      final String command =
          '-f concat -safe 0 -i $concatFilePath -c copy "$tempFilePath"';
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        // Save the final file
        final savedFilePath = await CommonMethods.saveFile(
          fileName: "inserted_audio.$extension",
          filePath: tempFilePath.replaceAll('"', ''),
        );

        if (savedFilePath != null) {
          // Success
          audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
          emit(const Completed());
        } else {
          emit(Error(
            error: "File is not saved",
            timeStamp: DateTime.now(),
            audioInsertBlocStateModel: audioInsertBlocStateModel,
          ));
        }
      } else {
        // Failure during FFmpeg execution
        final String errorMessage = await session.getOutput() ?? "Unknown error";
        emit(Error(
          error: "FFmpeg Error: $errorMessage",
          timeStamp: DateTime.now(),
          audioInsertBlocStateModel: audioInsertBlocStateModel,
        ));
      }
    } catch (e, stackTrace) {
      // Log error and reset state
      print("Error: $e\nStackTrace: $stackTrace");
      audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
      await CommonMethods.cleanupTempFiles();

      emit(Error(
        error: "An unexpected error occurred: $e",
        timeStamp: DateTime.now(),
        audioInsertBlocStateModel: audioInsertBlocStateModel,
      ));
    }finally{
       CommonMethods.cleanupTempFiles();

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
