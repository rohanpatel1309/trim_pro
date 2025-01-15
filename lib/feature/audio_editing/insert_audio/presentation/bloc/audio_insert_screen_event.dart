part of 'audio_insert_screen_bloc.dart';

sealed class AudioInsertScreenEvent extends Equatable {
  const AudioInsertScreenEvent();
}

final class PickFile extends AudioInsertScreenEvent {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class InsertAudio extends AudioInsertScreenEvent {
  final String insertAt;

  const InsertAudio({required this.insertAt});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class SetFileParameters extends AudioInsertScreenEvent {
  const SetFileParameters(
      {required this.filePath, required this.totalDuration});

  final String filePath;
  final Duration totalDuration;

  @override
  List<Object> get props => [filePath];
}

final class Reset extends AudioInsertScreenEvent {
  const Reset();

  @override
  List<Object> get props => [];
}
