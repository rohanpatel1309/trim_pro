import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter/return_code.dart';
import 'package:flutter_file_dialog/flutter_file_dialog.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/merge_audio/presentation/bloc/bloc_state_model/audio_merge_bloc_state_model.dart';

part 'audio_merge_screen_event.dart';

part 'audio_merge_screen_state.dart';

@injectable
class AudioMergeScreenBloc
    extends Bloc<AudioMergeScreenEvent, AudioMergeScreenState> {
  AudioMergeBlocStateModel audioMergeBlocStateModel =
      const AudioMergeBlocStateModel();

  AudioMergeScreenBloc()
      : super(const AudioMergeScreenState(
            audioMergeBlocStateModel: AudioMergeBlocStateModel())) {
    on<PickFile>(_onPickFile);
    on<MergeFile>(_onMergeFile);
  }

  /// Pick file
  Future<void> _onPickFile(
      PickFile event, Emitter<AudioMergeScreenState> emit) async {
    audioMergeBlocStateModel =
        audioMergeBlocStateModel.copyWith(isLoading: true);
    emit(AudioMergeScreenState(
        audioMergeBlocStateModel: audioMergeBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if (fileResult != null) {
      if (event.fileNo == 1) {
        audioMergeBlocStateModel = audioMergeBlocStateModel.copyWith(
            isLoading: false, fileUrl1: fileResult.files.single.path!);
      } else {
        audioMergeBlocStateModel = audioMergeBlocStateModel.copyWith(
            isLoading: false, fileUrl2: fileResult.files.single.path!);
      }
      emit(AudioMergeScreenState(
          audioMergeBlocStateModel: audioMergeBlocStateModel));
    } else {
      audioMergeBlocStateModel =
          audioMergeBlocStateModel.copyWith(isLoading: false);
      emit(Error(error: "Please Select File", timeStamp: DateTime.now(),audioMergeBlocStateModel: audioMergeBlocStateModel));
      emit(AudioMergeScreenState(
          audioMergeBlocStateModel: audioMergeBlocStateModel));
    }
  }

  /// Merge file
  Future<void> _onMergeFile(
      MergeFile event, Emitter<AudioMergeScreenState> emit) async {
    if (audioMergeBlocStateModel.fileUrl1.isEmpty) {
      emit(Error(error: "Please select a file 1", timeStamp: DateTime.now(),audioMergeBlocStateModel: audioMergeBlocStateModel));
      return;
    }

    if (audioMergeBlocStateModel.fileUrl2.isEmpty) {
      emit(Error(error: "Please select a file 2", timeStamp: DateTime.now(),audioMergeBlocStateModel: audioMergeBlocStateModel));
      return;
    }

    emit(AudioMergeScreenState(
        audioMergeBlocStateModel:
            audioMergeBlocStateModel.copyWith(isLoading: true)));

    try {
      final tempFilePath =
          "${(await getTemporaryDirectory()).path}/merged_audio.mp3";

      final command =
          "-i \"concat:${audioMergeBlocStateModel.fileUrl1}|${audioMergeBlocStateModel.fileUrl2}\" -acodec copy $tempFilePath";

      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        final params = SaveFileDialogParams(
          sourceFilePath: tempFilePath,
          fileName: "merged_audio.mp3",
        );
        await FlutterFileDialog.saveFile(params: params);

        final tempFile = File(tempFilePath);
        if (await tempFile.exists()) {
          await tempFile.delete();
        }

        emit(const Completed());
      } else {
        final errorLog = await session.getOutput();
        print(errorLog);
        emit(AudioMergeScreenState(
            audioMergeBlocStateModel:
                audioMergeBlocStateModel.copyWith(isLoading: false)));
        emit(Error(error: errorLog.toString(), timeStamp: DateTime.now(),audioMergeBlocStateModel: audioMergeBlocStateModel));
      }
    } catch (e) {
      print(e);
      emit(AudioMergeScreenState(
          audioMergeBlocStateModel:
              audioMergeBlocStateModel.copyWith(isLoading: false)));
      emit(Error(error: e.toString(), timeStamp: DateTime.now(),audioMergeBlocStateModel: audioMergeBlocStateModel));
    }
  }
}
