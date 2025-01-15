part of 'audio_cut_screen_bloc.dart';

sealed class AudioCutScreenEvent extends Equatable {
  const AudioCutScreenEvent();
}

final class SetFileParameters extends AudioCutScreenEvent {
  const SetFileParameters({required this.filePath, required this.totalDuration});
  final String filePath;
  final Duration totalDuration;

  @override
  List<Object> get props => [filePath];
}

final class CutAudio extends AudioCutScreenEvent {
  const CutAudio({required this.start, required this.end});
  final String start,end;

  @override
  List<Object> get props => [start,end];
}

final class Reset extends AudioCutScreenEvent {
  const Reset();

  @override
  List<Object> get props => [];
}
