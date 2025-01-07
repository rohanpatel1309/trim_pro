part of 'audio_merge_screen_bloc.dart';

sealed class AudioMergeScreenEvent extends Equatable {
  const AudioMergeScreenEvent();
}

final class PickFile extends AudioMergeScreenEvent {
  final int fileNo;

  const PickFile({required this.fileNo});

  @override
  // TODO: implement props
  List<Object?> get props => [fileNo];
}

final class MergeFile extends AudioMergeScreenEvent {
  const MergeFile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
