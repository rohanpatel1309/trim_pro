part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _Initial;
  const factory AudioState.loading() = _Loading;
  const factory AudioState.playing({
    required Duration position,
    required Duration duration,
  }) = _Playing;
  const factory AudioState.paused({
    required Duration position,
    required Duration duration,
  }) = _Paused;
  const factory AudioState.setPosition({required Duration duration}) = _SetPosition;
  const factory AudioState.error(String error) = _Error;
}
