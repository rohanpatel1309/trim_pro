part of 'audio_cut_screen_bloc.dart';

@freezed
class AudioCutScreenEvent with _$AudioCutScreenEvent {
  const factory AudioCutScreenEvent.started() = _Started;
  const factory AudioCutScreenEvent.pickFile() = _PickFile;
  const factory AudioCutScreenEvent.setTime() = _SetTime;
  const factory AudioCutScreenEvent.cutAudio() = _CutAudio;
}
