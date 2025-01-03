import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/bloc_state_model/audio_cut_bloc_state_model.dart';

part 'audio_cut_screen_event.dart';

part 'audio_cut_screen_state.dart';


@injectable
class AudioCutScreenBloc
    extends Bloc<AudioCutScreenEvent, AudioCutScreenState> {
  late String filePath;
  AudioCutBlocStateModel audioCutBlocStateModel = const AudioCutBlocStateModel(
    isLoading: false,
  );

  AudioCutScreenBloc() : super( const AudioCutScreenState(audioCutBlocStateModel: AudioCutBlocStateModel())) {
    on<SetFilePath>(_onSetPath);
    on<CutAudio>(_onCutAudio);
  }

  /// Set path
  void _onSetPath(SetFilePath event, Emitter<AudioCutScreenState> emit) {
    filePath = event.filePath;
  }

  /// Cut audio
  Future<void> _onCutAudio(
      CutAudio event, Emitter<AudioCutScreenState> emit) async {
    try {

      audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: true);

      emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));

      final Directory tempDir = await getTemporaryDirectory();
      final String tempFilePath = '${tempDir.path}/cut_audio_temp.mp3';

      final String command =
          '-i "$filePath" -ss ${event.start} -to ${event.end} -c copy "$tempFilePath"';

      // Execute FFmpeg command and wait for completion
      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        final params = SaveFileDialogParams(
          sourceFilePath: tempFilePath,
          fileName: "cut_audio.mp3", // Default file name for saving
        );

        final savedFilePath = await FlutterFileDialog.saveFile(params: params);

        // Delete temporary file
        final tempFile = File(tempFilePath);
        if (await tempFile.exists()) {
          await tempFile.delete();
        }

        if (savedFilePath != null) {
          audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false, isCompleted: true);
          emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel));
        } else {
          audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
          emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel.copyWith(error: "Something went wrong")));
        }
      } else {
        audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);

        emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel.copyWith(error: "Failed to cut audio. Code: $returnCode")));
      }
    } catch (e) {

      audioCutBlocStateModel = audioCutBlocStateModel.copyWith(isLoading: false);
      emit(AudioCutScreenState(audioCutBlocStateModel: audioCutBlocStateModel.copyWith(error: "An error occurred: $e")));

    }
  }

}
