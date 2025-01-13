
import 'package:freezed_annotation/freezed_annotation.dart';
part "audio_insert_bloc_state_model.freezed.dart";

@freezed
class AudioInsertBlocStateModel with _$AudioInsertBlocStateModel{

  const factory AudioInsertBlocStateModel({
    @Default(false) bool isLoading,
    @Default("") String fileUrl,
}) = _AudioInsertBlocStateModel;
}