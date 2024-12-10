import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/audio_bloc.dart';

const String audioUrl =
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

class CommonAudioPlayer extends StatelessWidget {
  const CommonAudioPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AudioBloc, AudioState>(
      builder: (context, state) {
        return state.maybeMap(orElse: () {
          return Center(
            child: ElevatedButton(
              onPressed: () {
                BlocProvider.of<AudioBloc>(context)
                    .add(const AudioEvent.play(url: audioUrl));
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
          return AudioPlayerWithSlider(
            state: state,
            isPlaying: true,
          );
        }, paused: (state) {
          return AudioPlayerWithSlider(
            state: state,
            isPlaying: false,
          );
        });
      },
    );
  }
}

class AudioPlayerWithSlider extends StatelessWidget {
  const AudioPlayerWithSlider(
      {super.key, required this.state, required this.isPlaying});

  final dynamic state;
  final bool isPlaying;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.music_note_rounded,
          size: 100.h,
          color: Colors.white,
        ),
        Slider(
          value: state.position.inSeconds.toDouble(),
          min: 0,
          max: state.duration.inSeconds.toDouble(),
          onChanged: (value) {
            BlocProvider.of<AudioBloc>(context).add(
              AudioEvent.seek(position: Duration(seconds: value.toInt())),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${state.position.inHours % 24} : ${state.position.inMinutes % 60} : ${state.position.inSeconds % 60}",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              Text(
                "${state.duration.inHours % 24} : ${state.duration.inMinutes % 60} : ${state.duration.inSeconds % 60}",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          onPressed: () {
            BlocProvider.of<AudioBloc>(context).add(isPlaying
                ? const AudioEvent.pause()
                : const AudioEvent.play(url: audioUrl));
          },
        ),
      ],
    );
  }
}
