import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/merge_audio/presentation/bloc/bloc_state_model/audio_merge_bloc_state_model.dart';

part 'audio_merge_screen_event.dart';

part 'audio_merge_screen_state.dart';

class AudioMergeScreenBloc extends Bloc<AudioMergeScreenEvent, AudioMergeScreenState> {
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
    emit(AudioMergeScreenState(audioMergeBlocStateModel: audioMergeBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if (fileResult != null) {
      if (event.fileNo == 1) {
        audioMergeBlocStateModel = audioMergeBlocStateModel.copyWith(
            isLoading: false, fileUrl1: fileResult.files.single.path!);
      } else {
        audioMergeBlocStateModel = audioMergeBlocStateModel.copyWith(
            isLoading: false, fileUrl2: fileResult.files.single.path!);
      }
      emit(AudioMergeScreenState(audioMergeBlocStateModel: audioMergeBlocStateModel));

    }else{
      audioMergeBlocStateModel = audioMergeBlocStateModel.copyWith(isLoading: false);
      emit(const Error( error: "Please Select File"));
      emit(AudioMergeScreenState(audioMergeBlocStateModel: audioMergeBlocStateModel));
    }
  }

  /// Merge file
  void _onMergeFile(MergeFile event, Emitter<AudioMergeScreenState> emitter) {}
}
