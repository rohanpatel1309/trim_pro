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
  late String filePath;
  late Duration totalDuration;
  AudioCutBlocStateModel audioCutBlocStateModel = const AudioCutBlocStateModel(
    isLoading: false,
  );

  AudioCutScreenBloc()
      : super(const AudioCutScreenState(
            audioCutBlocStateModel: AudioCutBlocStateModel())) {
    on<SetFileParameters>(_onSetFileParameters);
    on<CutAudio>(_onCutAudio);
  }

  /// Set path
  void _onSetFileParameters(
      SetFileParameters event, Emitter<AudioCutScreenState> emit) {
    filePath = event.filePath;
    totalDuration = event.totalDuration;
  }

  /// Cut audio

  Future<void> _onCutAudio(CutAudio event, Emitter<AudioCutScreenState> emit) async {
    final (isValid, errorMessage) = validate(startDuration: event.start, endDuration: event.end);

    if (isValid) {
      try {
        audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: true);
        emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));

        final Directory tempDir = await getTemporaryDirectory();
        const extension = "mp3";  // Always output as MP3
        final String tempFilePath = '${tempDir.path}/cut_audio_temp.$extension';

        // Delete temporary file if exists
        final tempFile = File(tempFilePath);
        if (await tempFile.exists()) {
          await tempFile.delete();
        }

        // FFmpeg command to cut and convert to MP3
        final String command =
            '-i "$filePath" -ss ${event.start} -to ${event.end} -c:a libmp3lame "$tempFilePath"';

        final session = await FFmpegKit.execute(command);
        // final logs = await session.getLogs();
        // logs.forEach((log) => print(log.getMessage()));

        final returnCode = await session.getReturnCode();

        if (ReturnCode.isSuccess(returnCode)) {


          final savedFilePath = await CommonMethods.saveFile(filePath: tempFilePath, fileName: "cut_audio.$extension");
          // Delete temporary file
          if (await tempFile.exists()) {
            await tempFile.delete();
          }

          if (savedFilePath != null) {
            audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
            emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));
            emit(const Completed());
          } else {
            audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
            emit(Error(error: "File is not saved", timeStamp: DateTime.now(), audioCutBlocStateModel: audioCutBlocStateModel));
          }
        } else {
          audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
          emit(Error(error: "Failed to cut audio. Code: $returnCode", timeStamp: DateTime.now(), audioCutBlocStateModel: audioCutBlocStateModel));
        }
      } catch (e) {
        audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
        emit(Error(error: "An error occurred: $e", timeStamp: DateTime.now(), audioCutBlocStateModel: audioCutBlocStateModel));
      }
    } else {
      emit(Error(error: errorMessage, timeStamp: DateTime.now(), audioCutBlocStateModel: audioCutBlocStateModel));
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

      if (start < Duration.zero || start > totalDuration) {
        return (false, "Start duration is out of range.");
      }

      if (end < Duration.zero || end > totalDuration) {
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

}
