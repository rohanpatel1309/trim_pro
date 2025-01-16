import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_speed_bloc_state_model.freezed.dart';

@freezed
class AudioSpeedBlocStateModel with _$AudioSpeedBlocStateModel{
  const factory AudioSpeedBlocStateModel({
    @Default("1.0x") String speed,
    @Default(false) bool isLoading,
  }) = _AudioSpeedBlocStateModel;
}