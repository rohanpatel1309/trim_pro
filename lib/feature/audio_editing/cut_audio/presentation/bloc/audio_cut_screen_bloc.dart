import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'audio_cut_screen_event.dart';
part 'audio_cut_screen_state.dart';

class AudioCutScreenBloc extends Bloc<AudioCutScreenEvent, AudioCutScreenState> {

  late String filePath;


  AudioCutScreenBloc() : super(AudioCutScreenInitial()) {


    on<SetFilePath>(_onSetPath);
  }

  /// Set path
  void _onSetPath(SetFilePath event, Emitter<AudioCutScreenState> emit){
      filePath = event.filePath;
  }
}
