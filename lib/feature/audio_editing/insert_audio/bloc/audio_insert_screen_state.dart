part of 'audio_insert_screen_bloc.dart';

final class AudioInsertScreenState extends Equatable {
  const AudioInsertScreenState({required this.audioInsertBlocStateModel});

  final AudioInsertBlocStateModel audioInsertBlocStateModel;

  @override
  // TODO: implement props
  List<Object?> get props => [audioInsertBlocStateModel];
}

final class Error extends AudioInsertScreenState {
  const Error({required this.error, required this.timeStamp, required super.audioInsertBlocStateModel});
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object?> get props => [error, timeStamp];
}

final class Completed extends AudioInsertScreenState{
  const Completed() : super(audioInsertBlocStateModel: const AudioInsertBlocStateModel());
  @override
  // TODO: implement props
  List<Object> get props => [];
}
