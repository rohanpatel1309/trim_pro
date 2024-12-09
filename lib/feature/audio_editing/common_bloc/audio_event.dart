part of 'audio_bloc.dart';

@freezed
class AudioEvent with _$AudioEvent {
  const factory AudioEvent.play({required String url}) = _Play;
  const factory AudioEvent.pause() = _Pause;
  const factory AudioEvent.getPosition() = _GetPosition;
}
