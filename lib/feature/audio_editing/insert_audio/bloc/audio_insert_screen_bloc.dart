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

      final delayMs = formatTimeToMilliseconds(event.insertAt);



      final command = '''
        -i "${filePath}" 
        -i "${audioInsertBlocStateModel.fileUrl}" 
        -filter_complex "[0]atrim=0:2[a1];[1]adelay=${delayMs}|${delayMs},atrim=0:5[a2];[0]atrim=2:10[a3];[a1][a2][a3]concat=n=3:v=0:a=1[out]" 
        -map "[out]" "$tempFilePath"
        ''';

      print('FFmpeg Command: $command');
      final session = await FFmpegKit.execute(command);

      final logs = await session.getLogs();
      logs.forEach((log) => print(log.getMessage()));

      final returnCode = await session.getReturnCode();
      if (ReturnCode.isSuccess(returnCode)) {
        final savedFilePath = await FlutterFileDialog.saveFile(
            params: SaveFileDialogParams(
                sourceFilePath: tempFilePath, fileName: "inserted_audio.mp3"));

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
  String formatTimeToMilliseconds(String hhmmss) {
    final parts = hhmmss.split(':').map(int.parse).toList();
    final hours = parts[0];
    final minutes = parts[1];
    final seconds = parts[2];
    return ((hours * 3600 + minutes * 60 + seconds) * 1000).toString();
  }
}
