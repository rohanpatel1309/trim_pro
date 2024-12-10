import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/audio_bloc.dart';

class CommonAudioPlayer extends StatelessWidget {
  final String audioUrl =
      "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

  const CommonAudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<AudioBloc>(),
      child: BlocBuilder<AudioBloc, AudioState>(
        builder: (context, state) {
          return state.maybeMap(orElse: () {
            return Center(
              child: ElevatedButton(
                onPressed: () {
                  BlocProvider.of<AudioBloc>(context)
                      .add(AudioEvent.play(url: audioUrl));
                },
                child: const Text('Play Audio'),
              ),
            );
          }, error: (state) {
            return Center(
              child: Text('Error: $state'),
            );
          }, loading: (state) {
            return const Center(child: CircularProgressIndicator());
          }, playing: (state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Playing'),
                Slider(
                  value: state.position.inSeconds.toDouble(),
                  min: 0,
                  max: state.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    BlocProvider.of<AudioBloc>(context).add(
                      AudioEvent.seek(
                          position: Duration(seconds: value.toInt())),
                    );
                  },
                ),
                Text("${state.position} / ${state.duration}"),
                IconButton(
                  icon: const Icon(Icons.pause),
                  onPressed: () {
                    BlocProvider.of<AudioBloc>(context)
                        .add(const AudioEvent.pause());
                  },
                ),
              ],
            );
          }, paused: (state) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Paused'),
                Slider(
                  value: state.position.inSeconds.toDouble(),
                  min: 0,
                  max: state.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    BlocProvider.of<AudioBloc>(context).add(
                      AudioEvent.seek(
                          position: Duration(seconds: value.toInt())),
                    );
                  },
                ),
                Text("${state.position} / ${state.duration}"),
                IconButton(
                  icon: const Icon(Icons.play_arrow),
                  onPressed: () {
                    BlocProvider.of<AudioBloc>(context)
                        .add(AudioEvent.play(url: audioUrl));
                  },
                ),
              ],
            );
          });
        },
      ),
    );
  }
}
