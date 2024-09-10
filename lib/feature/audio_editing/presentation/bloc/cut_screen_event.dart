part of 'cut_screen_bloc.dart';

@freezed
class CutScreenEvent with _$CutScreenEvent {
  const factory CutScreenEvent.started() = _Started;
  const factory CutScreenEvent.pickFile() = _PickFile;
  const factory CutScreenEvent.setTime() = _SetTime;
  const factory CutScreenEvent.cutAudio() = _CutAudio;
}
