part of 'common_audio_bloc.dart';

 final class CommonAudioState extends Equatable {
  const CommonAudioState({required this.commonBlocStateModel});
  final CommonBlocStateModel commonBlocStateModel;

  @override
  List<Object> get props => [commonBlocStateModel];
}

final class SetAudioFileUrl extends CommonAudioState{
  const SetAudioFileUrl({required super.commonBlocStateModel});

  @override
  // TODO: implement props
  List<Object> get props => [];
}


