part of 'audio_split_screen_bloc.dart';

sealed class AudioSplitScreenEvent extends Equatable {
  const AudioSplitScreenEvent();
}

final class PickFile extends AudioSplitScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SplitAudio extends AudioSplitScreenEvent {
  final String splitAt;

  const SplitAudio({required this.splitAt});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SetFileParameters extends AudioSplitScreenEvent {
  const SetFileParameters({required this.filePath, required this.totalDuration});
  final String filePath;
  final Duration totalDuration;

  @override
  List<Object> get props => [filePath];
}