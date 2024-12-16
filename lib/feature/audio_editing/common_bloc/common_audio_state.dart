part of 'common_audio_bloc.dart';

// Abstract base class representing all audio states
 class CommonAudioState extends Equatable {
  const CommonAudioState({required this.commonBlocDataModel});
  final CommonBlocDataModel commonBlocDataModel;

  @override
  List<Object> get props => [commonBlocDataModel];
}

