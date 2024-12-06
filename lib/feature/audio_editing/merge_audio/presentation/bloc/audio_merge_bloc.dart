import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'audio_merge_event.dart';
part 'audio_merge_state.dart';

class AudioMergeBloc extends Bloc<AudioMergeEvent, AudioMergeState> {
  AudioMergeBloc() : super(AudioMergeInitial()) {
    on<AudioMergeEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
