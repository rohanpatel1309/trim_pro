import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/insert_audio/bloc/bloc_state_model/audio_insert_bloc_state_model.dart';

part 'audio_insert_screen_event.dart';
part 'audio_insert_screen_state.dart';

@injectable
class AudioInsertScreenBloc extends Bloc<AudioInsertScreenEvent, AudioInsertScreenState> {
  
  AudioInsertBlocStateModel audioInsertBlocStateModel = const AudioInsertBlocStateModel();
  late Duration totalDuration;
  AudioInsertScreenBloc() : super(const AudioInsertScreenState(audioInsertBlocStateModel: AudioInsertBlocStateModel())) {
    on<PickFile>(_onPickFile);
    on<InsertAudio>(_onInsertAudio);
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
      emit(Error(error: "Please Select File", timeStamp: DateTime.now(),audioInsertBlocStateModel: audioInsertBlocStateModel));
      emit(AudioInsertScreenState(
          audioInsertBlocStateModel: audioInsertBlocStateModel));
    }
  }

  /// Insert file
  Future<void> _onInsertAudio(InsertAudio event, Emitter<AudioInsertScreenState> emit)async {
    try{

    }catch(e){

    }
  }

  /// Validate duration
  (bool, String) validate({
    required String insertAt,
  }) {
    try {

      final position =CommonMethods.parseDuration(insertAt);

      if (position < Duration.zero || position > totalDuration) {
        return (false, "Duration is out of range.");
      }


      return (true, "");
    } catch (e) {
      return (false, "$e");
    }
  }

}

