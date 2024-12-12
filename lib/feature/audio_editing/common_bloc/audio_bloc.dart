import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_bloc_data_model.dart';

part 'audio_event.dart';
part 'audio_state.dart';
part 'audio_bloc.freezed.dart';

@injectable
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription? _positionSubscription;
  CommonBlocDataModel commonBlocDataModel = CommonBlocDataModel(
      isPlayingNow: false,
      sliderValue: const Duration(seconds: 0),
      position: const Duration(seconds: 0),
      totalDuration: const Duration(seconds: 0));

  AudioBloc() : super(const AudioState.initial()) {
    on<_Play>(_onPlayAudioPlayer);
    on<_Pause>(_onPauseAudioPlayer);
    on<_Seek>(_onSeekAudioPlayer);
    on<_PickFile>(_onPickFile);
    on<_SetSliderValue>(_onSetSliderValue);  // Added event for slider value update
  }

  // Play audio player
  Future<void> _onPlayAudioPlayer(_Play event, Emitter<AudioState> emit) async {
    emit(const _Loading()); // Emit loading state immediately

    try {
      // Play the audio
      Future.delayed(const Duration(milliseconds: 500), () {
        _audioPlayer.play();
      });
      await for (final position in _audioPlayer.positionStream) {
        emit(AudioState.playing(commonBlocDataModel: commonBlocDataModel.copyWith(
          position: position,
          isPlayingNow: true,
        )));
      }
    } catch (e) {
      // Emit error state if an error occurs
      emit(_Error(e.toString()));
    }
  }

  // Pause audio player
  Future<void> _onPauseAudioPlayer(_Pause event, Emitter<AudioState> emit) async {
    await _audioPlayer.pause();

    emit(AudioState.paused(commonBlocDataModel: commonBlocDataModel.copyWith(
      position: _audioPlayer.position,
      isPlayingNow: false,
    )));
  }

  // Seek audio player to new position
  Future<void> _onSeekAudioPlayer(_Seek event, Emitter<AudioState> emit) async {
    await _audioPlayer.seek(event.position);
    await _audioPlayer.play();
    commonBlocDataModel = commonBlocDataModel.copyWith(
      position: event.position,
      isPlayingNow: true,
    );
    emit(AudioState.playing(commonBlocDataModel: commonBlocDataModel));
  }

  // Pick file and set URL to the audio player
  Future<void> _onPickFile(_PickFile event, Emitter<AudioState> emit) async {
    final fileResult = await CommonMethods.pickFile();
    emit(const AudioState.loading());
    await _audioPlayer.setUrl(fileResult!.files.single.path!);
    await Future.delayed(const Duration(seconds: 1));
    commonBlocDataModel = commonBlocDataModel.copyWith(totalDuration: _audioPlayer.duration);
    emit( AudioState.setUrl(commonBlocDataModel: commonBlocDataModel));
  }

  // Update slider value in the state while sliding
  Future<void> _onSetSliderValue(_SetSliderValue event, Emitter<AudioState> emit) async {
    commonBlocDataModel = commonBlocDataModel.copyWith(sliderValue: event.position);
    emit(AudioState.updateSliderValue(commonBlocDataModel: commonBlocDataModel));
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
