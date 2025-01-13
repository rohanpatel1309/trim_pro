import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/split_audio/presentation/bloc/bloc_state_model/audio_split_bloc_state_model.dart';

part 'audio_split_screen_event.dart';

part 'audio_split_screen_state.dart';

@injectable
class AudioSplitScreenBloc
    extends Bloc<AudioSplitScreenEvent, AudioSplitScreenState> {
  AudioSplitBlocStateModel audioSplitBlocStateModel =
      const AudioSplitBlocStateModel();
  late String filePath;
  late Duration totalDuration;

  AudioSplitScreenBloc()
      : super(const AudioSplitScreenState(
            audioSplitBlocStateModel: AudioSplitBlocStateModel())) {
    on<SetFileParameters>(_onSetFileParameters);
    on<SplitAudio>(_onSplitAudio);
  }

  /// Set file parameter
  void _onSetFileParameters(
      SetFileParameters event, Emitter<AudioSplitScreenState> emit) {
    totalDuration = event.totalDuration;
    filePath = event.filePath;
  }

  /// Split audio files
  Future<void> _onSplitAudio(
      SplitAudio event, Emitter<AudioSplitScreenState> emit) async {
    try {

      // Validate the splitAt time
      final (isValid, message) = validate(splitAt: event.splitAt);
      if (!isValid) {
        emit(Error(
            error: message,
            timeStamp: DateTime.now(),
            audioSplitBlocStateModel: audioSplitBlocStateModel));
        return;
      }

      audioSplitBlocStateModel =
          audioSplitBlocStateModel.copyWith(isLoading: true);
      emit(AudioSplitScreenState(
          audioSplitBlocStateModel: audioSplitBlocStateModel));

      final tempDir = await getTemporaryDirectory();
      const extension = "mp3";

      // Original file path
      String originalFilePath = filePath;

      // Part 1 and Part 2 paths
      String part1Path = '${tempDir.path}/split_part1.$extension';
      String part2Path = '${tempDir.path}/split_part2.$extension';

      // Delete existing temporary files
      final part1File = File(part1Path);
      final part2File = File(part2Path);

      if (await part1File.exists()) {
        await part1File.delete();
      }
      if (await part2File.exists()) {
        await part2File.delete();
      }

      // Split the file using FFmpeg
      await FFmpegKit.execute(
          "-i $originalFilePath -ss 0 -to ${event.splitAt} -c copy $part1Path");
      await FFmpegKit.execute(
          "-i $originalFilePath -ss ${event.splitAt} -c copy $part2Path");

      // Save the split files
      final savedPart1Path = await CommonMethods.saveFile(
          fileName: "split_part1.$extension", filePath: part1Path);
      final savedPart2Path = await CommonMethods.saveFile(
          fileName: "split_part2.$extension", filePath: part2Path);

      if (savedPart1Path != null && savedPart2Path != null) {
        // Clean up temporary files
        if (await part1File.exists()) {
          await part1File.delete();
        }
        if (await part2File.exists()) {
          await part2File.delete();
        }

        audioSplitBlocStateModel =
            audioSplitBlocStateModel.copyWith(isLoading: false);
        emit(const Completed());
      } else {
        audioSplitBlocStateModel =
            audioSplitBlocStateModel.copyWith(isLoading: false);
        emit(Error(
            error: "Failed to save split files",
            timeStamp: DateTime.now(),
            audioSplitBlocStateModel: audioSplitBlocStateModel));
      }
    } catch (e, stackTrace) {
      audioSplitBlocStateModel =
          audioSplitBlocStateModel.copyWith(isLoading: false);
      print('Error: $e, StackTrace: $stackTrace');
      emit(Error(
          error: "An unexpected error occurred: $e",
          timeStamp: DateTime.now(),
          audioSplitBlocStateModel: audioSplitBlocStateModel));
    }
  }

  /// Validate duration
  (bool, String) validate({
    required String splitAt,
  }) {
    try {
      final position = CommonMethods.parseDuration(splitAt);

      if (position < Duration.zero || position > totalDuration) {
        return (false, "Duration is out of range.");
      }

      return (true, "");
    } catch (e) {
      return (false, "$e");
    }
  }
}
