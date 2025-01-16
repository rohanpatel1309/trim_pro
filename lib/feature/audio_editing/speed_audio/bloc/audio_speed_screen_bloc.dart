import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/speed_audio/bloc/bloc_state_model/audio_speed_bloc_state_model.dart';

part 'audio_speed_screen_event.dart';

part 'audio_speed_screen_state.dart';

@injectable
class AudioSpeedScreenBloc
    extends Bloc<AudioSpeedScreenEvent, AudioSpeedScreenState> {
  AudioSpeedBlocStateModel audioSpeedBlocStateModel =
      const AudioSpeedBlocStateModel();

  AudioSpeedScreenBloc()
      : super(const AudioSpeedScreenState(
            audioSpeedBlocStateModel: AudioSpeedBlocStateModel())) {
    on<SetAudioSpeed>(_onSetAudioSpeed);
    on<Reset>(_onReset);
    on<SaveFile>(_onSaveFile);
    on<SetFileParameters>(_onSetFileParameter);
  }

  /// Set audio speed
  void _onSetAudioSpeed(
      SetAudioSpeed event, Emitter<AudioSpeedScreenState> emit) {
    audioSpeedBlocStateModel =
        audioSpeedBlocStateModel.copyWith(speed: event.speed);
    emit(AudioSpeedScreenState(
        audioSpeedBlocStateModel: audioSpeedBlocStateModel));
  }

  /// Reset
  void _onReset(Reset event, Emitter<AudioSpeedScreenState> emit) {
    audioSpeedBlocStateModel = const AudioSpeedBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioSpeedScreenState(
        audioSpeedBlocStateModel: audioSpeedBlocStateModel));
  }

  /// Save file with adjusted speed and convert to MP3
  Future<void> _onSaveFile(
      SaveFile event, Emitter<AudioSpeedScreenState> emit) async {
    // Validate the speed input
    final speedValue =
    double.tryParse(audioSpeedBlocStateModel.speed.replaceAll('x', ''));

    try {
      // Show loading state
      audioSpeedBlocStateModel =
          audioSpeedBlocStateModel.copyWith(isLoading: true);
      emit(AudioSpeedScreenState(
          audioSpeedBlocStateModel: audioSpeedBlocStateModel));

      // Prepare file paths
      final Directory tempDir = await getTemporaryDirectory();
      const String extension = "mp3"; // Always output as MP3
      final String tempFilePath =
          '${tempDir.path}/speed_adjusted_temp.$extension';

      // Delete temporary file if it exists
      await CommonMethods.cleanupTempFiles();

      // FFmpeg command for adjusting speed and converting to MP3
      final String command =
          '-i "${audioSpeedBlocStateModel.filePath}" -filter:a "atempo=${speedValue}" -c:a libmp3lame "$tempFilePath"';

      // Execute FFmpeg command
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        // Save the adjusted audio file to a user-selected location
        final String? savedFilePath = await CommonMethods.saveFile(
          filePath: tempFilePath,
          fileName: "speed_adjusted.$extension",
        );

        if (savedFilePath != null) {
          // Success: Update state and emit completion
          audioSpeedBlocStateModel =
              audioSpeedBlocStateModel.copyWith(isLoading: false);
          emit(Completed(audioSpeedBlocStateModel: audioSpeedBlocStateModel));
        } else {
          // File save failed
          audioSpeedBlocStateModel =
              audioSpeedBlocStateModel.copyWith(isLoading: false);
          emit(Error(
            error: "File is not saved",
            timeStamp: DateTime.now(),
            audioSpeedBlocStateModel: audioSpeedBlocStateModel,
          ));
        }
      } else {
        // FFmpeg command failed
        audioSpeedBlocStateModel =
            audioSpeedBlocStateModel.copyWith(isLoading: false);
        final String errorLog = await session.getOutput() ?? "Unknown error";
        emit(Error(
          error: "Failed to adjust audio speed. Code: $returnCode\n$errorLog",
          timeStamp: DateTime.now(),
          audioSpeedBlocStateModel: audioSpeedBlocStateModel,
        ));
      }
    } catch (e) {
      // Handle unexpected errors
      audioSpeedBlocStateModel =
          audioSpeedBlocStateModel.copyWith(isLoading: false);
      await CommonMethods.cleanupTempFiles();

      emit(Error(
        error: "An error occurred: $e",
        timeStamp: DateTime.now(),
        audioSpeedBlocStateModel: audioSpeedBlocStateModel,
      ));
    } finally {
      CommonMethods.cleanupTempFiles();
    }
  }

  /// On Set file parameter
  void _onSetFileParameter(SetFileParameters event, Emitter<AudioSpeedScreenState> emit){
    audioSpeedBlocStateModel = audioSpeedBlocStateModel.copyWith(filePath: event.filePath);
  }

  @override
  Future<void> close() {
    CommonMethods.cleanupTempFiles();

    // TODO: implement close
    return super.close();
  }

}
