
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_cut_bloc_state_model.freezed.dart';

@freezed
class AudioCutBlocStateModel with _$AudioCutBlocStateModel {
  const factory AudioCutBlocStateModel({
    @Default(false) bool isLoading,
    @Default(false) bool isCompleted,

}) = _AudioCutBlocStateModel;
}
