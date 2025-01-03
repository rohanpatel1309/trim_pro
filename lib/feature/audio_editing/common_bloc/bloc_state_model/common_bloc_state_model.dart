import 'package:freezed_annotation/freezed_annotation.dart';

part 'common_bloc_state_model.freezed.dart';

@freezed
class CommonBlocStateModel with _$CommonBlocStateModel {
  const factory CommonBlocStateModel({
    @Default(false) bool isPlayingNow,
    @Default(false) bool isLoading,
    @Default("") String fileUrl,
    @Default("") String error,
    @Default(Duration(seconds: 0)) Duration position,
    @Default(Duration(seconds: 0)) Duration totalDuration,
  }) = _CommonBlocStateModel;
}
