import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/bloc_state_model/audio_cut_bloc_state_model.dart';

part 'audio_cut_screen_event.dart';

part 'audio_cut_screen_state.dart';

@injectable
class AudioCutScreenBloc
    extends Bloc<AudioCutScreenEvent, AudioCutScreenState> {
  AudioCutBlocStateModel audioCutBlocStateModel = const AudioCutBlocStateModel(
    isLoading: false,
  );

  AudioCutScreenBloc()
      : super(const AudioCutScreenState(
            audioCutBlocStateModel: AudioCutBlocStateModel())) {
    on<SetFileParameters>(_onSetFileParameters);
    on<CutAudio>(_onCutAudio);
    on<Reset>(_onReset);
  }

  /// Set path
  void _onSetFileParameters(
      SetFileParameters event, Emitter<AudioCutScreenState> emit) {
    audioCutBlocStateModel = audioCutBlocStateModel.copyWith(
        filePath: event.filePath, totalDuration: event.totalDuration);
  }

  /// Cut audio
  Future<void> _onCutAudio(
      CutAudio event, Emitter<AudioCutScreenState> emit) async {
    // Validate start and end durations
    final (isValid, errorMessage) =
        validate(startDuration: event.start, endDuration: event.end);

    if (!isValid) {
      emit(Error(
        error: errorMessage,
        timeStamp: DateTime.now(),
        audioCutBlocStateModel: audioCutBlocStateModel,
      ));
      return;
    }

    try {
      // Show loading state
      audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: true);
      emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));

      // Prepare file paths
      final Directory tempDir = await getTemporaryDirectory();
      const String extension = "mp3"; // Always output as MP3
      final String tempFilePath = '${tempDir.path}/cut_audio_temp.$extension';

      // Delete temporary file if it exists
      await CommonMethods.cleanupTempFiles();

      // Ensure the input file path is properly escaped
      final String command =
          '-i "${audioCutBlocStateModel.filePath}" -ss ${event.start} -to ${event.end} -c:a libmp3lame "$tempFilePath"';

      // Execute FFmpeg command
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        // Save the cut audio file to a user-selected location
        final String? savedFilePath = await CommonMethods.saveFile(
          filePath: tempFilePath,
          fileName: "cut_audio.$extension",
        );

        if (savedFilePath != null) {
          // Success: Update state and emit completion
          audioCutBlocStateModel =
              audioCutBlocStateModel.copyWith(isLoading: false);
          emit(Completed(audioCutBlocStateModel: audioCutBlocStateModel));
        } else {
          // File save failed
          audioCutBlocStateModel =
              audioCutBlocStateModel.copyWith(isLoading: false);
          emit(Error(
            error: "File is not saved",
            timeStamp: DateTime.now(),
            audioCutBlocStateModel: audioCutBlocStateModel,
          ));
        }
      } else {
        // FFmpeg command failed
        audioCutBlocStateModel =
            audioCutBlocStateModel.copyWith(isLoading: false);
        final String errorLog = await session.getOutput() ?? "Unknown error";
        emit(Error(
          error: "Failed to cut audio. Code: $returnCode\n$errorLog",
          timeStamp: DateTime.now(),
          audioCutBlocStateModel: audioCutBlocStateModel,
        ));
      }
    } catch (e) {
      // Handle unexpected errors
      audioCutBlocStateModel =
          audioCutBlocStateModel.copyWith(isLoading: false);
      await CommonMethods.cleanupTempFiles();

      emit(Error(
        error: "An error occurred: $e",
        timeStamp: DateTime.now(),
        audioCutBlocStateModel: audioCutBlocStateModel,
      ));
    } finally {
      CommonMethods.cleanupTempFiles();
    }
  }

  /// Validate duration
  (bool, String) validate({
    required String startDuration,
    required String endDuration,
  }) {
    try {
      final start = CommonMethods.parseDuration(startDuration);
      final end = CommonMethods.parseDuration(endDuration);

      if (start < Duration.zero ||
          start > audioCutBlocStateModel.totalDuration) {
        return (false, "Start duration is out of range.");
      }

      if (end < Duration.zero || end > audioCutBlocStateModel.totalDuration) {
        return (false, "End duration is out of range.");
      }

      if (start >= end || (end - start).inSeconds < 1) {
        return (
          false,
          "Start must be less than end, with at least 1-second difference."
        );
      }

      return (true, "");
    } catch (e) {
      return (false, "$e");
    }
  }

  /// Reset
  void _onReset(Reset event, Emitter<AudioCutScreenState> emit) {
    audioCutBlocStateModel = const AudioCutBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));
  }
}
