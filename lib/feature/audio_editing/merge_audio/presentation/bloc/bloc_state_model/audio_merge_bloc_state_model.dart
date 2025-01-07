import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_merge_bloc_state_model.freezed.dart';

@freezed
class AudioMergeBlocStateModel with _$AudioMergeBlocStateModel{
  const factory AudioMergeBlocStateModel({
    @Default("") String fileUrl1,
    @Default("") String fileUrl2,
    @Default(false) bool isLoading,
}) = _AudioMergeBlocStateModel;
}