part of 'audio_bloc.dart';

@freezed
class AudioState with _$AudioState {
  const factory AudioState.initial() = _Initial;
  const factory AudioState.loading() = _Loading;
  const factory AudioState.setUrl({
    required CommonBlocDataModel commonBlocDataModel,
  }) = _SetUrl;
  const factory AudioState.playing({
    required CommonBlocDataModel commonBlocDataModel,
  }) = _Playing;
  const factory AudioState.paused({
    required CommonBlocDataModel commonBlocDataModel,
  }) = _Paused;
  const factory AudioState.setPosition({
    required CommonBlocDataModel commonBlocDataModel,
  }) = _SetPosition;
  const factory AudioState.error(String error) = _Error;

  // Added state to handle slider value during the slide
  const factory AudioState.updateSliderValue({
    required CommonBlocDataModel commonBlocDataModel,
  }) = _UpdateSliderValue;
}
