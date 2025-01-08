part of 'audio_merge_screen_bloc.dart';


final class AudioMergeScreenState extends Equatable {
  const AudioMergeScreenState({required this.audioMergeBlocStateModel});

  final AudioMergeBlocStateModel audioMergeBlocStateModel;
  @override
  // TODO: implement props
  List<Object?> get props => [audioMergeBlocStateModel];
}

final class Error extends AudioMergeScreenState{
  const Error({required this.error,required this.timeStamp, required super.audioMergeBlocStateModel});
  final String error;
  final DateTime timeStamp;

  @override
  // TODO: implement props
  List<Object> get props => [error,timeStamp];
}

final class Completed extends AudioMergeScreenState{
  const Completed() : super(audioMergeBlocStateModel: const AudioMergeBlocStateModel());
  @override
  // TODO: implement props
  List<Object> get props => [];
}



