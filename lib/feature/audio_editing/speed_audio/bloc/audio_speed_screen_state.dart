part of 'audio_speed_screen_bloc.dart';

class AudioSpeedScreenState extends Equatable {
  const AudioSpeedScreenState({required this.audioSpeedBlocStateModel});
  final AudioSpeedBlocStateModel audioSpeedBlocStateModel;
  @override
  // TODO: implement props
  List<Object?> get props => [audioSpeedBlocStateModel];
}

final class Error extends AudioSpeedScreenState {
  const Error({required this.error, required this.timeStamp, required super.audioSpeedBlocStateModel});
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object?> get props => [error, timeStamp];
}

final class Completed extends AudioSpeedScreenState {
  const Completed({required super.audioSpeedBlocStateModel});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
