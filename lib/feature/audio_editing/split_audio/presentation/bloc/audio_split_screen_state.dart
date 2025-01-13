part of 'audio_split_screen_bloc.dart';

final class AudioSplitScreenState extends Equatable {
  final AudioSplitBlocStateModel audioSplitBlocStateModel;
  const AudioSplitScreenState({required this.audioSplitBlocStateModel});

  @override
  // TODO: implement props
  List<Object?> get props => [audioSplitBlocStateModel];
}


final class Error extends AudioSplitScreenState {
  const Error({required this.error, required this.timeStamp, required super.audioSplitBlocStateModel});
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object?> get props => [error, timeStamp,audioSplitBlocStateModel];
}

final class Completed extends AudioSplitScreenState{
  const Completed() : super(audioSplitBlocStateModel:  const AudioSplitBlocStateModel());
  @override
  // TODO: implement props
  List<Object> get props => [];
}