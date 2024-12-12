part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.play() = _Play;
  const factory AudioEvent.pause() = _Pause;
  const factory AudioEvent.seek({required Duration position}) = _Seek;
  const factory AudioEvent.pickFile() = _PickFile;
  const factory AudioEvent.setSliderValue({required Duration position}) = _SetSliderValue;  // Added event for slider value
}
