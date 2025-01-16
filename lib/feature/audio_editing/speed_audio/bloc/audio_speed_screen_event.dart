part of 'audio_speed_screen_bloc.dart';

sealed class AudioSpeedScreenEvent extends Equatable {
  const AudioSpeedScreenEvent();
}

final class SetAudioSpeed extends AudioSpeedScreenEvent{
  final String speed;

  const SetAudioSpeed({required this.speed});
  @override
  // TODO: implement props
  List<Object?> get props => [speed];

}

final class Reset extends AudioSpeedScreenEvent{

  const Reset();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

final class SaveFile extends AudioSpeedScreenEvent{

  const SaveFile();
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

final class SetFileParameters extends AudioSpeedScreenEvent {
  const SetFileParameters({required this.filePath,});
  final String filePath;

  @override
  List<Object> get props => [filePath];
}
