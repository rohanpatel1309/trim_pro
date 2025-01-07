part of 'audio_merge_screen_bloc.dart';


final class AudioMergeScreenState extends Equatable {
  const AudioMergeScreenState({required this.audioMergeBlocStateModel});

  final AudioMergeBlocStateModel audioMergeBlocStateModel;
  @override
  // TODO: implement props
  List<Object?> get props => [audioMergeBlocStateModel];
}

final class Error extends AudioMergeScreenState{
  const Error({required this.error}) : super(audioMergeBlocStateModel: const AudioMergeBlocStateModel());
  final String error;
  @override
  // TODO: implement props
  List<Object> get props => [error];
}



