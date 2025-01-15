import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
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
    on<Reset>(_onReset);
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
      emit(Error(
          error: "Please select a file 1",
          timeStamp: DateTime.now(),
          audioMergeBlocStateModel: audioMergeBlocStateModel));
      return;
    }

    if (audioMergeBlocStateModel.fileUrl2.isEmpty) {
      emit(Error(
          error: "Please select a file 2",
          timeStamp: DateTime.now(),
          audioMergeBlocStateModel: audioMergeBlocStateModel));
      return;
    }

    emit(AudioMergeScreenState(
        audioMergeBlocStateModel: audioMergeBlocStateModel.copyWith(isLoading: true)));

    try {
      final tempDir = await getTemporaryDirectory();
      const extension = "mp3";
      final tempFilePath = "${tempDir.path}/merged_audio.$extension";

      // Remove the temporary file if it exists from previous merges
      await CommonMethods.cleanupTempFiles();

      // Properly handle file paths with spaces by enclosing them in double quotes
      final command =
          '-i "${audioMergeBlocStateModel.fileUrl1}" -i "${audioMergeBlocStateModel.fileUrl2}" -filter_complex "[0:a:0][1:a:0]concat=n=2:v=0:a=1[out]" -map "[out]" -c:a libmp3lame "$tempFilePath"';

      final session = await FFmpegKit.execute(command);
      final logs = await session.getLogs();
      logs.forEach((log) => print(log.getMessage()));
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        final savedFilePath = await CommonMethods.saveFile(
            fileName: "merged_Audio.$extension", filePath: tempFilePath);

        if (savedFilePath != null) {
          emit(const Completed());
        } else {
          emit(Error(
              error: "File is not saved",
              timeStamp: DateTime.now(),
              audioMergeBlocStateModel: audioMergeBlocStateModel));
        }
      } else {
        final errorLog = await session.getOutput();
        print(errorLog);
        emit(Error(
            error: errorLog.toString(),
            timeStamp: DateTime.now(),
            audioMergeBlocStateModel: audioMergeBlocStateModel));
      }
    } catch (e) {
      print(e);
      await CommonMethods.cleanupTempFiles();

      emit(AudioMergeScreenState(
          audioMergeBlocStateModel: audioMergeBlocStateModel.copyWith(isLoading: false)));
      emit(Error(
          error: e.toString(),
          timeStamp: DateTime.now(),
          audioMergeBlocStateModel: audioMergeBlocStateModel));
    }finally{

      CommonMethods.cleanupTempFiles();

    }
  }

  /// Reset
  void _onReset(Reset event, Emitter<AudioMergeScreenState> emit){
    audioMergeBlocStateModel = const AudioMergeBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioMergeScreenState(audioMergeBlocStateModel: audioMergeBlocStateModel));
  }


}
