import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_event.dart';

part 'audio_state.dart';

part 'audio_bloc.freezed.dart';

@singleton
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();

  AudioBloc() : super(const AudioState.initial()) {
    on<_Play>(_onPlayAudioPlayer);
    on<_Pause>(_onPauseAudioPlayer);
  }

  /// Play audio player
  Future<void> _onPlayAudioPlayer(_Play event, Emitter<AudioState> emit) async {
    emit(const _Loading());
    try {
      await _audioPlayer.setUrl(event.url);
      await _audioPlayer.play();
      emit(const _Playing());
    } catch (e) {
      emit(_Error(e.toString()));
    }
  }

  /// Pause audio player
  Future<void> _onPauseAudioPlayer(
      _Pause event, Emitter<AudioState> emit) async {
    await _audioPlayer.pause();
    emit(const _Paused());
  }
}
