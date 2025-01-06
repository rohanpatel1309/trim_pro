part of 'common_audio_bloc.dart';

 final class CommonAudioState extends Equatable {
  const CommonAudioState({required this.commonBlocStateModel});
  final CommonBlocStateModel commonBlocStateModel;

  @override
  List<Object> get props => [commonBlocStateModel];
}

final class SetAudioFileUrl extends CommonAudioState{
   const SetAudioFileUrl({required this.url, required this.totalDuration}) : super(commonBlocStateModel: const CommonBlocStateModel());
    final String url;
    final Duration totalDuration;
  @override
  // TODO: implement props
  List<Object> get props => [url];
}

final class Error extends CommonAudioState{
  const Error({required this.error}) : super(commonBlocStateModel: const CommonBlocStateModel());
  final String error;
  @override
  // TODO: implement props
  List<Object> get props => [error];
}



