part of 'common_audio_bloc.dart';

sealed class CommonAudioEvent extends Equatable {
  const CommonAudioEvent();
}

final class CommonAudioPickFile extends CommonAudioEvent {
  const CommonAudioPickFile();

  @override
  List<Object> get props => [];
}

final class CommonAudioPlay extends CommonAudioEvent {
  const CommonAudioPlay();

  @override
  List<Object> get props => [];
}

final class CommonAudioPause extends CommonAudioEvent {
  const CommonAudioPause();

  @override
  List<Object> get props => [];
}

final class CommonAudioSeek extends CommonAudioEvent {
  const CommonAudioSeek({required this.position});

  final Duration position;
  @override
  List<Object> get props => [position];
}

final class CommonAudioSetSliderValue extends CommonAudioEvent {
  const CommonAudioSetSliderValue({required this.position});
  final Duration position;


  @override
  List<Object> get props => [position];
}

final class ResetFile extends CommonAudioEvent {
  const ResetFile();


  @override
  List<Object> get props => [];
}

final class SetAudioSpeed extends CommonAudioEvent {
  const SetAudioSpeed({required this.speed});
  final double speed;

  @override
  List<Object> get props => [speed];
}