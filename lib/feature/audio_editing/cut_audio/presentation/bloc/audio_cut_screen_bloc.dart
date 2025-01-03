import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:path_provider/path_provider.dart';

part 'audio_cut_screen_event.dart';

part 'audio_cut_screen_state.dart';

class AudioCutScreenBloc
    extends Bloc<AudioCutScreenEvent, AudioCutScreenState> {
  late String filePath;

  AudioCutScreenBloc() : super(AudioCutScreenInitial()) {
    on<SetFilePath>(_onSetPath);
    on<CutAudio>(_onCutAudio);
  }

  /// Set path
  void _onSetPath(SetFilePath event, Emitter<AudioCutScreenState> emit) {
    filePath = event.filePath;
  }

  /// Cut audio
  /// Cut audio
  Future<void> _onCutAudio(
      CutAudio event, Emitter<AudioCutScreenState> emit) async {
    try {
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
          emit(AudioCutSuccess());
        } else {
          emit(const AudioCutFailure(error: "File save operation canceled."));
        }
      } else {
        emit(AudioCutFailure(error: "Failed to cut audio. Code: $returnCode"));
      }
    } catch (e) {
      emit(AudioCutFailure(error: "An error occurred: $e"));
    }
  }

}
