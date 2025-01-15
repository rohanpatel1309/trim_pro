import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/bloc_state_model/common_bloc_state_model.dart';

part 'common_audio_event.dart';

part 'common_audio_state.dart';

@injectable
class CommonAudioBloc extends Bloc<CommonAudioEvent, CommonAudioState> {
  AudioPlayer? _audioPlayer;
  CommonBlocStateModel commonBlocStateModel = const CommonBlocStateModel(
      isPlayingNow: false,
      position: Duration(seconds: 0),
      totalDuration: Duration(seconds: 0));


  CommonAudioBloc()
      : super(const CommonAudioState(commonBlocStateModel: CommonBlocStateModel())) {

    on<CommonAudioPickFile>(_onPickFile);
    on<CommonAudioPlay>(_onPlayAudioPlayer);
    on<CommonAudioPause>(_onPauseAudioPlayer);
    on<CommonAudioSeek>(_onSeekAudioPlayer);
    on<CommonAudioSetSliderValue>(_onSetSliderValue);
    on<ResetFile>(_onResetFile);
  }

  // Pick file and set URL to the audio player
  Future<void> _onPickFile(
      CommonAudioPickFile event, Emitter<CommonAudioState> emit) async {

    commonBlocStateModel = commonBlocStateModel.copyWith(
        isLoading: true);

    emit(CommonAudioState(
        commonBlocStateModel: commonBlocStateModel));

    final fileResult = await CommonMethods.pickFile();

    if(fileResult != null){

      commonBlocStateModel = commonBlocStateModel.copyWith(
          fileUrl: fileResult.files.single.path!);
      emit(CommonAudioState(
          commonBlocStateModel: commonBlocStateModel));
      _audioPlayer = AudioPlayer();
      await _audioPlayer!.setUrl(fileResult.files.single.path!);


      commonBlocStateModel = commonBlocStateModel.copyWith(
        totalDuration: _audioPlayer!.duration!,);
      emit(SetAudioFileUrl(url: fileResult.files.single.path!,totalDuration: commonBlocStateModel.totalDuration));
      emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));

      _audioPlayer!.play();

      await for (final position in _audioPlayer!.positionStream) {
        commonBlocStateModel = commonBlocStateModel.copyWith(
          position: position,
          isPlayingNow: true,
          isLoading: false,
        );
        emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
      }
    }else{
      commonBlocStateModel = commonBlocStateModel.copyWith(isLoading: false);
      emit(const Error( error: "Please Select File"));
      emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
    }

  }

  // Play audio player
  Future<void> _onPlayAudioPlayer(
      CommonAudioPlay event, Emitter<CommonAudioState> emit) async {
    try {
      // Play the audio

      Future.delayed(const Duration(milliseconds: 500), () {
        _audioPlayer!.play();
      });

    } catch (e) {
      // Emit error state if an error occurs
      emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
    }
  }

  // Pause audio player
  Future<void> _onPauseAudioPlayer(
      CommonAudioPause event, Emitter<CommonAudioState> emit) async {
    await _audioPlayer!.pause();

    commonBlocStateModel = commonBlocStateModel.copyWith(
      position: _audioPlayer!.position,
      isPlayingNow: false,
    );

    emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
  }

  // Seek audio player to new position
  Future<void> _onSeekAudioPlayer(
      CommonAudioSeek event, Emitter<CommonAudioState> emit) async {
    await _audioPlayer!.seek(event.position);
   if(commonBlocStateModel.isPlayingNow) {
     await _audioPlayer!.play();
   }
     commonBlocStateModel = commonBlocStateModel.copyWith(
       position: event.position,
     );

    emit(CommonAudioState(
        commonBlocStateModel: commonBlocStateModel));
  }

  // Update slider value in the state while sliding
  Future<void> _onSetSliderValue(
      CommonAudioSetSliderValue event, Emitter<CommonAudioState> emit) async {
    if(_audioPlayer!.playing){
      await _audioPlayer!.pause();
    }
    commonBlocStateModel =
        commonBlocStateModel.copyWith(position: event.position);
    emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
  }

  /// Reset file
  void _onResetFile(ResetFile event , Emitter<CommonAudioState> emit){
    commonBlocStateModel = commonBlocStateModel.copyWith(fileUrl: "");
    emit(CommonAudioState(commonBlocStateModel: commonBlocStateModel));
    _disposeAudioPlayer();
  }

  void _disposeAudioPlayer(){
    _audioPlayer?.dispose();

  }

  @override
  Future<void> close() {
    // TODO: implement close
    _disposeAudioPlayer();
    return super.close();

  }
}
