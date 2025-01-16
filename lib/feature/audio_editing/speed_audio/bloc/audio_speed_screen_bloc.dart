import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/speed_audio/bloc/bloc_state_model/audio_speed_bloc_state_model.dart';

part 'audio_speed_screen_event.dart';
part 'audio_speed_screen_state.dart';

@injectable
class AudioSpeedScreenBloc extends Bloc<AudioSpeedScreenEvent, AudioSpeedScreenState> {

  AudioSpeedBlocStateModel audioSpeedBlocStateModel = const AudioSpeedBlocStateModel();

  AudioSpeedScreenBloc() : super(const AudioSpeedScreenState(audioSpeedBlocStateModel: AudioSpeedBlocStateModel())) {
    on<SetAudioSpeed>(_onSetAudioSpeed);
    on<Reset>(_onReset);
  }

  /// Set audio speed
  void _onSetAudioSpeed(SetAudioSpeed event, Emitter<AudioSpeedScreenState> emit){
    audioSpeedBlocStateModel = audioSpeedBlocStateModel.copyWith(speed: event.speed);
    emit(AudioSpeedScreenState(audioSpeedBlocStateModel: audioSpeedBlocStateModel));

  }

  /// Reset
  void _onReset(Reset event, Emitter<AudioSpeedScreenState> emit){
    audioSpeedBlocStateModel = const AudioSpeedBlocStateModel();
    CommonMethods.cleanupTempFiles();
    emit(AudioSpeedScreenState(audioSpeedBlocStateModel: audioSpeedBlocStateModel));
  }



}
