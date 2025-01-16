part of 'audio_convert_screen_bloc.dart';

sealed class AudioConvertScreenEvent extends Equatable {
  const AudioConvertScreenEvent();
}

final class PickFile extends AudioConvertScreenEvent {
  const PickFile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class ConvertFile extends AudioConvertScreenEvent {
  const ConvertFile();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

final class UpdateExtension extends AudioConvertScreenEvent {
  final String extension;
  const UpdateExtension({required this.extension});

  @override
  // TODO: implement props
  List<Object?> get props => [extension];
}

final class Reset extends AudioConvertScreenEvent {
  const Reset();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
