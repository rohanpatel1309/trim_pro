part of 'audio_cut_screen_bloc.dart';

final class AudioCutScreenState extends Equatable {
  const AudioCutScreenState({required this.audioCutBlocStateModel});

  final AudioCutBlocStateModel audioCutBlocStateModel;

  @override
  // TODO: implement props
  List<Object?> get props => [audioCutBlocStateModel];
}

final class Error extends AudioCutScreenState {
  const Error( {required this.error, required this.timeStamp}) : super(audioCutBlocStateModel: const AudioCutBlocStateModel());
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object?> get props => [error,timeStamp];
}



