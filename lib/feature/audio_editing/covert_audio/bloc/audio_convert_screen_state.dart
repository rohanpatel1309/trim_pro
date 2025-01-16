part of 'audio_convert_screen_bloc.dart';

final class AudioConvertScreenState extends Equatable {

  final AudioConvertBlocStateModel audioConvertBlocStateModel;

  const AudioConvertScreenState({required this.audioConvertBlocStateModel});

  @override
  // TODO: implement props
  List<Object?> get props => [audioConvertBlocStateModel];
}

final class Error extends AudioConvertScreenState{
  const Error({required this.error,required this.timeStamp, required super.audioConvertBlocStateModel});
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object> get props => [error,timeStamp];
}

final class Completed extends AudioConvertScreenState{
  const Completed({required super.audioConvertBlocStateModel});
  @override
  // TODO: implement props
  List<Object> get props => [];
}


