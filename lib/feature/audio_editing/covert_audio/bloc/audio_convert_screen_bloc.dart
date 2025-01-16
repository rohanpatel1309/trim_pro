import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/covert_audio/bloc/bloc_state_model/audio_convert_bloc_state_model.dart';

part 'audio_convert_screen_event.dart';

part 'audio_convert_screen_state.dart';

@injectable
class AudioConvertScreenBloc
    extends Bloc<AudioConvertScreenEvent, AudioConvertScreenState> {
  AudioConvertBlocStateModel audioConvertBlocStateModel =
      const AudioConvertBlocStateModel();

  AudioConvertScreenBloc()
      : super(const AudioConvertScreenState(
            audioConvertBlocStateModel: AudioConvertBlocStateModel())) {
    on<PickFile>(_onPickFile);
    on<Reset>(_onReset);
    on<UpdateExtension>(_onUpdateExtension);
  }

  /// Set file parameter
  Future<void> _onPickFile(
      PickFile event, Emitter<AudioConvertScreenState> emit) async {
    audioConvertBlocStateModel =
        audioConvertBlocStateModel.copyWith(isLoading: true);
    emit(AudioConvertScreenState(
        audioConvertBlocStateModel: audioConvertBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if (fileResult != null) {
      audioConvertBlocStateModel = audioConvertBlocStateModel.copyWith(
          isLoading: false, filePath: fileResult.files.single.path!);

      emit(AudioConvertScreenState(
          audioConvertBlocStateModel: audioConvertBlocStateModel));
    } else {
      audioConvertBlocStateModel =
          audioConvertBlocStateModel.copyWith(isLoading: false);
      emit(Error(
          error: "Please Select File",
          timeStamp: DateTime.now(),
          audioConvertBlocStateModel: audioConvertBlocStateModel));
      emit(AudioConvertScreenState(
          audioConvertBlocStateModel: audioConvertBlocStateModel));
    }
  }

  /// Reset
  void _onReset(Reset event , Emitter<AudioConvertScreenState> emit){
    audioConvertBlocStateModel = const AudioConvertBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioConvertScreenState(audioConvertBlocStateModel: audioConvertBlocStateModel));
  }

  /// Update extension
  void _onUpdateExtension(UpdateExtension event, Emitter<AudioConvertScreenState> emit){
    audioConvertBlocStateModel = audioConvertBlocStateModel.copyWith(extension: event.extension);
    emit(AudioConvertScreenState(audioConvertBlocStateModel: audioConvertBlocStateModel));
  }

}
