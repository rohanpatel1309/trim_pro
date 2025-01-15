
import 'package:freezed_annotation/freezed_annotation.dart';
part "audio_split_bloc_state_model.freezed.dart";

@freezed
class AudioSplitBlocStateModel with _$AudioSplitBlocStateModel{

  const factory AudioSplitBlocStateModel({
    @Default(false) bool isLoading,
    @Default("") String filePath,
    @Default(Duration()) Duration totalDuration,
  }) = _AudioSplitBlocStateModel;
}
