import 'package:freezed_annotation/freezed_annotation.dart';
part 'audio_convert_bloc_state_model.freezed.dart';

@freezed
class AudioConvertBlocStateModel with _$AudioConvertBlocStateModel{
  const factory AudioConvertBlocStateModel({
    @Default("") String filePath,
    @Default("mp3") String extension,
    @Default(false) bool isLoading,
  }) = _AudioConvertBlocStateModel;
}