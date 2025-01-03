part of 'audio_cut_screen_bloc.dart';

sealed class AudioCutScreenState extends Equatable {
  const AudioCutScreenState();
}

final class AudioCutScreenInitial extends AudioCutScreenState {
  @override
  List<Object> get props => [];
}


final class AudioCutSuccess extends AudioCutScreenState {
  @override
  List<Object> get props => [];
}

final class AudioCutFailure extends AudioCutScreenState {

  const AudioCutFailure({required this.error});

  final String error;
  @override
  List<Object> get props => [];
}
