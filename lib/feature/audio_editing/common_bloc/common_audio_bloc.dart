import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_model/common_bloc_data_model.dart';

part 'common_audio_event.dart';

part 'common_audio_state.dart';

@injectable
class CommonAudioBloc extends Bloc<CommonAudioEvent, CommonAudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  CommonBlocDataModel commonBlocDataModel = CommonBlocDataModel(
      isPlayingNow: false,
      position: const Duration(seconds: 0),
      totalDuration: const Duration(seconds: 0));


  CommonAudioBloc()
      : super(CommonAudioState(commonBlocDataModel: CommonBlocDataModel())) {
    on<CommonAudioEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CommonAudioPickFile>(_onPickFile);
    on<CommonAudioPlay>(_onPlayAudioPlayer);
    on<CommonAudioPause>(_onPauseAudioPlayer);
    on<CommonAudioSeek>(_onSeekAudioPlayer);
    on<CommonAudioSetSliderValue>(_onSetSliderValue);
  }

  // Pick file and set URL to the audio player
  Future<void> _onPickFile(
      CommonAudioPickFile event, Emitter<CommonAudioState> emit) async {

    commonBlocDataModel = commonBlocDataModel.copyWith(
        isLoading: true);

    final fileResult = await CommonMethods.pickFile();


    emit(CommonAudioState(
        commonBlocDataModel: commonBlocDataModel));

    await _audioPlayer.setUrl(fileResult!.files.single.path!);

    commonBlocDataModel = commonBlocDataModel.copyWith(isSetUrl: true);

    commonBlocDataModel = commonBlocDataModel.copyWith(
        totalDuration: _audioPlayer.duration, isPlayingNow: true,isLoading: false);
    emit(CommonAudioState(commonBlocDataModel: commonBlocDataModel));
    Future.delayed(const Duration(seconds: 1), () {
      _audioPlayer.play();
    });
    await for (final position in _audioPlayer.positionStream) {
      commonBlocDataModel = commonBlocDataModel.copyWith(
        position: position,
        isPlayingNow: true,
        isLoading: false,
      );
      emit(CommonAudioState(commonBlocDataModel: commonBlocDataModel));
    }
  }

  // Play audio player
  Future<void> _onPlayAudioPlayer(
      CommonAudioPlay event, Emitter<CommonAudioState> emit) async {
    try {
      // Play the audio

      Future.delayed(const Duration(milliseconds: 500), () {
        _audioPlayer.play();
      });

    } catch (e) {
      // Emit error state if an error occurs
      emit(CommonAudioState(commonBlocDataModel: commonBlocDataModel));
    }
  }

  // Pause audio player
  Future<void> _onPauseAudioPlayer(
      CommonAudioPause event, Emitter<CommonAudioState> emit) async {
    await _audioPlayer.pause();

    commonBlocDataModel = commonBlocDataModel.copyWith(
      position: _audioPlayer.position,
      isPlayingNow: false,
    );

    emit(CommonAudioState(commonBlocDataModel: commonBlocDataModel));
  }

  // Seek audio player to new position
  Future<void> _onSeekAudioPlayer(
      CommonAudioSeek event, Emitter<CommonAudioState> emit) async {
    await _audioPlayer.seek(event.position);
   if(commonBlocDataModel.isPlayingNow) {
     await _audioPlayer.play();
   }
     commonBlocDataModel = commonBlocDataModel.copyWith(
       position: event.position,
     );

    emit(CommonAudioState(
        commonBlocDataModel: commonBlocDataModel));
  }

  // Update slider value in the state while sliding
  Future<void> _onSetSliderValue(
      CommonAudioSetSliderValue event, Emitter<CommonAudioState> emit) async {
    if(_audioPlayer.playing){
      await _audioPlayer.pause();
    }
    commonBlocDataModel =
        commonBlocDataModel.copyWith(position: event.position);
    emit(CommonAudioState(commonBlocDataModel: commonBlocDataModel));
  }

  @override
  Future<void> close() {
    // TODO: implement close
    _audioPlayer.dispose();
    return super.close();

  }
}
