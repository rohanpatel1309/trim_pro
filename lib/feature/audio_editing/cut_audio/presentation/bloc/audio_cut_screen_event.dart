part of 'audio_cut_screen_bloc.dart';

sealed class AudioCutScreenEvent extends Equatable {
  const AudioCutScreenEvent();
}

final class SetFilePath extends AudioCutScreenEvent {
  const SetFilePath({required this.filePath, });
  final String filePath;

  @override
  List<Object> get props => [filePath];
}

final class CutAudio extends AudioCutScreenEvent {
  const CutAudio({required this.start, required this.end});
  final String start,end;

  @override
  List<Object> get props => [start,end];
}
