import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/audio_bloc.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_bloc_data_model.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_button.dart';

const String audioUrl =
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

class CommonAudioPlayer extends StatelessWidget {
  const CommonAudioPlayer({super.key, required this.tools});

  final Widget tools;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AudioBloc, AudioState>(
  listener: (context, state) {
    // TODO: implement listener
    state.mapOrNull(
      setUrl: (state)  {

        BlocProvider.of<AudioBloc>(context).add(const AudioEvent.play());


      }
    );
  },
  builder: (context, state) {
        return state.maybeMap(orElse: () {
          return Center(
            child: CommonButton(
              onTap: () => onFileSelection(context),
              buttonText: 'Select File',
            ),
          );
        }, error: (state) {
          return Center(
            child: Text('Error: $state'),
          );
        }, loading: (state) {
          return const Center(child: CircularProgressIndicator(color: Colors.white,));
        }, playing: (state) {
          return AudioPlayerWithSlider(
          commonBlocDataModel: state.commonBlocDataModel,
            tools: tools,
          );
        }, paused: (state) {
          return AudioPlayerWithSlider(
            commonBlocDataModel: state.commonBlocDataModel,

            tools: tools,
          );
        },
          updateSliderValue: (state){
          return AudioPlayerWithSlider(commonBlocDataModel: state.commonBlocDataModel, tools: tools);
          }
        );
      },
    );

  }

  /// File selection event
  void onFileSelection(BuildContext context) {
    BlocProvider.of<AudioBloc>(context).add(const AudioEvent.pickFile());
  }
}

class AudioPlayerWithSlider extends StatelessWidget {
  const AudioPlayerWithSlider(
      {super.key,
      required this.commonBlocDataModel,
        required this.tools,
      });

  final CommonBlocDataModel commonBlocDataModel;
  final Widget tools;

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
          activeColor: Colors.white,
          inactiveColor: Colors.white,
          value: commonBlocDataModel.sliderValue.inSeconds.toDouble(),
          min: 0,
          max: commonBlocDataModel.totalDuration.inSeconds.toDouble(),
          onChanged: (value) {
            BlocProvider.of<AudioBloc>(context).add(
              AudioEvent.setSliderValue(position: Duration(seconds: value.toInt())),
            );
          },
          onChangeEnd: (value) {
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
                "${commonBlocDataModel.position.inHours % 24} : ${commonBlocDataModel.position.inMinutes % 60} : ${commonBlocDataModel.position.inSeconds % 60}",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
              Text(
                "${commonBlocDataModel.totalDuration.inHours % 24} : ${commonBlocDataModel.totalDuration.inMinutes % 60} : ${commonBlocDataModel.totalDuration.inSeconds % 60}",
                style: TextStyle(color: Colors.white, fontSize: 12.sp),
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            commonBlocDataModel.isPlayingNow ? Icons.pause : Icons.play_arrow,
            color: Colors.white,
            size: 45.h,
          ),
          onPressed: () {
            BlocProvider.of<AudioBloc>(context).add(commonBlocDataModel.isPlayingNow
                ? const AudioEvent.pause()
                : const AudioEvent.play());
          },
        ),
        SizedBox(
          height: 40.h,
        ),
        tools,
      ],
    );
  }
}
