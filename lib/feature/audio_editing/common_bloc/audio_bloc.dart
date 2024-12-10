import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';

part 'audio_event.dart';

part 'audio_state.dart';

part 'audio_bloc.freezed.dart';

@injectable
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription? _positionSubscription;

  AudioBloc() : super(const AudioState.initial()) {
    on<_Play>(_onPlayAudioPlayer);
    on<_Pause>(_onPauseAudioPlayer);
    on<_Seek>(_onSeekAudioPlayer);
  }

  /// Play audio player
  Future<void> _onPlayAudioPlayer(_Play event, Emitter<AudioState> emit) async {
    emit(const _Loading()); // Emit loading state immediately

    try {
      // Set the URL for the audio player and await its completion
      await _audioPlayer.setUrl(event.url);

      // Play the audio once the URL is set
      _audioPlayer.play();

      await for (final position in _audioPlayer.positionStream) {
        final currentDuration = _audioPlayer.duration ?? Duration.zero;
        emit(AudioState.playing(position: position, duration: currentDuration));
      }

      // Subscribe to position stream and emit the updated position periodically
    } catch (e) {
      // If any error occurs while setting the URL or playing the audio, emit error state
      emit(_Error(e.toString()));
    }
  }


  /// Pause audio player
  Future<void> _onPauseAudioPlayer(_Pause event, Emitter<AudioState> emit) async {
    await _audioPlayer.pause();

    final duration = _audioPlayer.duration ?? Duration.zero;
    emit(AudioState.paused(position: _audioPlayer.position, duration: duration));
  }

  /// Seek to a specific position in the audio
  Future<void> _onSeekAudioPlayer(_Seek event, Emitter<AudioState> emit) async {
    await _audioPlayer.seek(event.position);

    // Emit the updated position and duration
    final duration = _audioPlayer.duration ?? Duration.zero;
    emit(AudioState.playing(position: _audioPlayer.position, duration: duration));
  }

  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
