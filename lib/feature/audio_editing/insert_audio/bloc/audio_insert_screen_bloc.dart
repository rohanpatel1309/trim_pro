import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
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
        emit(Error(error: "Please select a file", timeStamp: DateTime.now(), audioInsertBlocStateModel: audioInsertBlocStateModel));
        return;
      }

      final (isValid, message) = validate(insertAt: event.insertAt);
      if (!isValid) {
        emit(Error(error: message, timeStamp: DateTime.now(), audioInsertBlocStateModel: audioInsertBlocStateModel));
        return;
      }

      audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: true);
      emit(AudioInsertScreenState(audioInsertBlocStateModel: audioInsertBlocStateModel));

      final tempDir = await getTemporaryDirectory();
      final tempFilePath = '${tempDir.path}/insert_audio_temp.mp3';

      // Convert the position time (insertAt) to milliseconds
      final delayMs = formatTimeToMilliseconds(event.insertAt);

      // Paths to the original files (F1 and F2)
      String f1Path = filePath; // F1 file path
      String f2Path = audioInsertBlocStateModel.fileUrl; // F2 file path (file to insert)


      // Step 2: Trim F1 before the insertion point (0 to insertAt)
      String part1Path = '${tempDir.path}/f1_part1.mp3';
      await FFmpegKit.execute(
          "-i $f1Path -ss 0 -to ${event.insertAt} -c copy $part1Path"
      );

      print("ooo $totalDuration}");
      // Step 3: Trim F1 after the insertion point (insertAt to the end)
      String part2Path = '${tempDir.path}/f1_part2.mp3';
      await FFmpegKit.execute(
          "-i $f1Path -ss ${event.insertAt} -to $totalDuration -c copy $part2Path"
      );

      // Step 4: Concatenate Part 1, F2, and Part 2
      final outputPath = tempFilePath;
      String command = '-i "concat:$part1Path|$f2Path|$part2Path" -c copy $outputPath';

      print('FFmpeg Command: $command');
      final session = await FFmpegKit.execute(command);

      final logs = await session.getLogs();
      logs.forEach((log) => print(log.getMessage()));

      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        final savedFilePath = await FlutterFileDialog.saveFile(
            params: SaveFileDialogParams(
                sourceFilePath: tempFilePath,
                fileName: "inserted_audio.mp3"
            )
        );

        if (savedFilePath != null) {
          audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
          emit(Completed());
        } else {
          audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
          emit(Error(error: "File is not saved", timeStamp: DateTime.now(), audioInsertBlocStateModel: audioInsertBlocStateModel));
        }
      } else {
        final errorMessage = await session.getFailStackTrace();
        print("FFmpeg Error: $errorMessage");
        audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
        emit(Error(error: "FFmpeg Error: $errorMessage", timeStamp: DateTime.now(), audioInsertBlocStateModel: audioInsertBlocStateModel));
      }
    } catch (e, stackTrace) {
      audioInsertBlocStateModel = audioInsertBlocStateModel.copyWith(isLoading: false);
      print('Error: $e, StackTrace: $stackTrace');
      emit(Error(error: "An unexpected error occurred: $e", timeStamp: DateTime.now(), audioInsertBlocStateModel: audioInsertBlocStateModel));
    }
  }

  /// Helper function to get audio file duration in seconds
  Future<String> _getAudioDuration(String filePath) async {
    final session = await FFmpegKit.execute("-i $filePath");
    final returnCode = await session.getReturnCode();

    if (ReturnCode.isSuccess(returnCode)) {
      final logs = await session.getLogs();
      for (var log in logs) {
        if (log.getMessage().contains('Duration:')) {
          final durationString = log.getMessage().split('Duration:')[1].split(',')[0];
          final durationParts = durationString.split(':');
          final durationInSeconds = (int.parse(durationParts[0]) * 3600) +
              (int.parse(durationParts[1]) * 60) +
              int.parse(durationParts[2].split('.')[0]);
          return durationParts[0] + durationParts[1] + durationParts[2].split('.')[0];
        }
      }
    }
    return "";
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
