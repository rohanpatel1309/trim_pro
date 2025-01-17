import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ffmpeg_kit_flutter_audio/ffmpeg_kit.dart';
import 'package:ffmpeg_kit_flutter_audio/return_code.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/core/app_utils/ffmpeg_command.dart';
import 'package:trim_pro/feature/audio_editing/covert_audio/bloc/bloc_state_model/audio_convert_bloc_state_model.dart';

part 'audio_convert_screen_event.dart';

part 'audio_convert_screen_state.dart';

@injectable
class AudioConvertScreenBloc
    extends Bloc<AudioConvertScreenEvent, AudioConvertScreenState> {
  AudioConvertBlocStateModel audioConvertBlocStateModel =
      const AudioConvertBlocStateModel();

  AudioConvertScreenBloc()
      : super(const AudioConvertScreenState(
            audioConvertBlocStateModel: AudioConvertBlocStateModel())) {
    on<PickFile>(_onPickFile);
    on<Reset>(_onReset);
    on<UpdateExtension>(_onUpdateExtension);
    on<ConvertFile>(_onConvertFile);
  }

  /// Set file parameter
  Future<void> _onPickFile(
      PickFile event, Emitter<AudioConvertScreenState> emit) async {
    audioConvertBlocStateModel =
        audioConvertBlocStateModel.copyWith(isLoading: true);
    emit(AudioConvertScreenState(
        audioConvertBlocStateModel: audioConvertBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if (fileResult != null) {
      audioConvertBlocStateModel = audioConvertBlocStateModel.copyWith(
          isLoading: false, filePath: fileResult.files.single.path!);

      emit(AudioConvertScreenState(
          audioConvertBlocStateModel: audioConvertBlocStateModel));
    } else {
      audioConvertBlocStateModel =
          audioConvertBlocStateModel.copyWith(isLoading: false);
      emit(Error(
          error: "Please Select File",
          timeStamp: DateTime.now(),
          audioConvertBlocStateModel: audioConvertBlocStateModel));
      emit(AudioConvertScreenState(
          audioConvertBlocStateModel: audioConvertBlocStateModel));
    }
  }

  /// Reset
  void _onReset(Reset event, Emitter<AudioConvertScreenState> emit) {
    audioConvertBlocStateModel = const AudioConvertBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioConvertScreenState(
        audioConvertBlocStateModel: audioConvertBlocStateModel));
  }

  /// Update extension
  void _onUpdateExtension(
      UpdateExtension event, Emitter<AudioConvertScreenState> emit) {
    audioConvertBlocStateModel =
        audioConvertBlocStateModel.copyWith(extension: event.extension);
    emit(AudioConvertScreenState(
        audioConvertBlocStateModel: audioConvertBlocStateModel));
  }

  /// Convert File
  Future<void> _onConvertFile(
      ConvertFile event, Emitter<AudioConvertScreenState> emit) async {
    if (audioConvertBlocStateModel.filePath.isEmpty) {
      emit(Error(
          error: "Please Select File",
          timeStamp: DateTime.now(),
          audioConvertBlocStateModel: audioConvertBlocStateModel));
      return;
    }

    final String outputFormat =
        audioConvertBlocStateModel.extension.toLowerCase();

    final selectedFileExtension =
        audioConvertBlocStateModel.filePath.split(".").last;

    if (outputFormat == selectedFileExtension ||
        outputFormat == selectedFileExtension.toLowerCase()) {
      emit(Error(
          error: "Input and Output file extensions are same",
          timeStamp: DateTime.now(),
          audioConvertBlocStateModel: audioConvertBlocStateModel));
      return;
    }

    try {
      // Show loading state
      audioConvertBlocStateModel =
          audioConvertBlocStateModel.copyWith(isLoading: true);
      emit(AudioConvertScreenState(
          audioConvertBlocStateModel: audioConvertBlocStateModel));

      // Prepare file paths
      final Directory tempDir = await getTemporaryDirectory();
      final String tempFilePath =
          '${tempDir.path}/converted_audio.$outputFormat';

      // Delete temporary file if it exists
      await CommonMethods.cleanupTempFiles();
      final codec = getCodec(outputFormat: outputFormat);
      // Execute FFmpeg command
      final String command = FfmpegCommand.convertAudioCommand
          .replaceFirst("filePath", audioConvertBlocStateModel.filePath)
          .replaceFirst("codec", codec)
          .replaceFirst("tempFilePath", tempFilePath);

      final session = await FFmpegKit.execute(command);
      final returnCode = await session.getReturnCode();

      if (ReturnCode.isSuccess(returnCode)) {
        // Save the converted file to a user-selected location
        final String? savedFilePath = await CommonMethods.saveFile(
          filePath: tempFilePath,
          fileName: "converted_audio.$outputFormat",
        );

        if (savedFilePath != null) {
          // Success: Update state and emit completion
          audioConvertBlocStateModel =
              audioConvertBlocStateModel.copyWith(isLoading: false);
          emit(AudioConvertScreenState(
              audioConvertBlocStateModel: audioConvertBlocStateModel));
          emit(Completed(
              audioConvertBlocStateModel: audioConvertBlocStateModel));
        } else {
          // File save failed
          audioConvertBlocStateModel =
              audioConvertBlocStateModel.copyWith(isLoading: false);
          emit(Error(
            error: "File is not saved",
            timeStamp: DateTime.now(),
            audioConvertBlocStateModel: audioConvertBlocStateModel,
          ));
        }
      } else {
        // FFmpeg command failed
        audioConvertBlocStateModel =
            audioConvertBlocStateModel.copyWith(isLoading: false);
        final String errorLog = await session.getOutput() ?? "Unknown error";
        emit(Error(
          error: "Failed to convert audio. Code: $returnCode\n$errorLog",
          timeStamp: DateTime.now(),
          audioConvertBlocStateModel: audioConvertBlocStateModel,
        ));
      }
    } catch (e) {
      // Handle unexpected errors
      audioConvertBlocStateModel =
          audioConvertBlocStateModel.copyWith(isLoading: false);
      await CommonMethods.cleanupTempFiles();

      emit(Error(
        error: "An error occurred: $e",
        timeStamp: DateTime.now(),
        audioConvertBlocStateModel: audioConvertBlocStateModel,
      ));
    } finally {
      CommonMethods.cleanupTempFiles();
    }
  }

  /// Codec
  String getCodec({required String outputFormat}) {
    switch (outputFormat) {
      case 'aac':
        return 'aac';

      case 'ac3':
        return 'ac3';

      case 'aif':
      case 'aifc':
      case 'aiff':
        return 'pcm_s16le';

      case 'amr':
        return 'libopencore_amrnb';

      case 'au':
      case 'caf':
      case 'voc':
      case 'wav':
        return 'pcm_s16le';

      case 'dts':
        return 'dts';

      case 'flac':
        return 'flac';

      case 'mp2':
        return 'mp2';

      case 'mp3':
        return 'libmp3lame';

      case 'm4a':
      case 'm4b':
        return 'aac';

      case 'oga':
      case 'ogg':
        return 'libvorbis';

      case 'ra':
        return 'pcm_s16le';

      case 'wma':
        return 'wmav2';
    }
    return "";
  }

  @override
  Future<void> close() {
    CommonMethods.cleanupTempFiles();

    // TODO: implement close
    return super.close();
  }
}
