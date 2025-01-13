import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_full_gpl/return_code.dart';
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
  late String part1Path, part2Path;
  late File part1File, part2File;

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
      // Validation...
      audioSplitBlocStateModel =
          audioSplitBlocStateModel.copyWith(isLoading: true);
      emit(AudioSplitScreenState(
          audioSplitBlocStateModel: audioSplitBlocStateModel));

      final tempDir = await getTemporaryDirectory();
      const extension = "mp3";

      // Convert input file to MP3
      String convertedMp3Path = '${tempDir.path}/input_converted.mp3';
      final session = await FFmpegKit.execute(
          "-i $filePath -vn -acodec libmp3lame $convertedMp3Path");
      if (!ReturnCode.isSuccess(await session.getReturnCode())) {
        final failStackTrace = await session.getFailStackTrace();
        throw Exception('FFmpeg Conversion Error: $failStackTrace');
      }

      String part1Path = '${tempDir.path}/split_part1.$extension';
      String part2Path = '${tempDir.path}/split_part2.$extension';

      // Create Part 1
      final part1Session = await FFmpegKit.execute(
          "-i $convertedMp3Path -ss 0 -to ${event.splitAt} -c copy $part1Path");
      if (!ReturnCode.isSuccess(await part1Session.getReturnCode())) {
        final failStackTrace = await part1Session.getFailStackTrace();
        throw Exception('FFmpeg Error (Part 1): $failStackTrace');
      }

      // Verify Part 1
      if (!(await File(part1Path).exists())) {
        throw Exception('File not created: $part1Path');
      }

      // Create Part 2
      final part2Session = await FFmpegKit.execute(
          "-i $convertedMp3Path -ss ${event.splitAt} -c copy $part2Path");
      if (!ReturnCode.isSuccess(await part2Session.getReturnCode())) {
        final failStackTrace = await part2Session.getFailStackTrace();
        throw Exception('FFmpeg Error (Part 2): $failStackTrace');
      }

      // Verify Part 2
      if (!(await File(part2Path).exists())) {
        throw Exception('File not created: $part2Path');
      }

      // Save files
      final savedPart1Path = await CommonMethods.saveFile(
          fileName: "split_part1.$extension", filePath: part1Path);
      final savedPart2Path = await CommonMethods.saveFile(
          fileName: "split_part2.$extension", filePath: part2Path);

      if (savedPart1Path != null && savedPart2Path != null) {
        audioSplitBlocStateModel =
            audioSplitBlocStateModel.copyWith(isLoading: false);
        emit(const Completed());
      } else {
        throw Exception('Failed to save split files.');
      }
    } catch (e, stackTrace) {
      print('Error: $e, StackTrace: $stackTrace');
      audioSplitBlocStateModel =
          audioSplitBlocStateModel.copyWith(isLoading: false);
      emit(Error(
          error: e.toString(),
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
