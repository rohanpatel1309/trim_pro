part of 'audio_cut_screen_bloc.dart';

sealed class AudioCutScreenState extends Equatable {
  const AudioCutScreenState();
}

final class AudioCutScreenInitial extends AudioCutScreenState {
  @override
  List<Object> get props => [];
}
