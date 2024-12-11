import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';

part 'audio_event.dart';

part 'audio_state.dart';

part 'audio_bloc.freezed.dart';

@injectable
class AudioBloc extends Bloc<AudioEvent, AudioState> {
  final AudioPlayer _audioPlayer = AudioPlayer();
  StreamSubscription? _positionSubscription;
  bool isPlayed = false;

  AudioBloc() : super(const AudioState.initial()) {
    on<_Play>(_onPlayAudioPlayer);
    on<_Pause>(_onPauseAudioPlayer);
    on<_Seek>(_onSeekAudioPlayer,transformer: restartable());
    on<_PickFile>(_onPickFile);
  }

  /// Play audio player
  Future<void> _onPlayAudioPlayer(_Play event, Emitter<AudioState> emit) async {
    emit(const _Loading()); // Emit loading state immediately

    try {
      // Set the URL for the audio player and await its completion
      if(!isPlayed){
        isPlayed = true;
      }else{
        _audioPlayer.seek(_audioPlayer.position);
      }
      // Play the audio once the URL is set
      Future.delayed(const Duration(milliseconds: 500),(){
        _audioPlayer.play();
      });
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
    if(_audioPlayer.playing){
      print("inn");
      emit(AudioState.playing(position: _audioPlayer.position, duration: duration));
    }else{
      print("inn1");
      emit(AudioState.paused(position: _audioPlayer.position, duration: duration));
    }

  }

  /// Pick File
  Future<void> _onPickFile(_PickFile event, Emitter<AudioState> emit) async {
    final fileResult = await CommonMethods.pickFile();
    emit(const AudioState.loading());
    await _audioPlayer.setUrl(fileResult!.files.single.path!);
    emit(const AudioState.setUrl());
  }



  @override
  Future<void> close() {
    _positionSubscription?.cancel();
    _audioPlayer.dispose();
    return super.close();
  }
}
