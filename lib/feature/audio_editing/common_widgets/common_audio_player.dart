import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_bloc/bloc_state_model/common_bloc_state_model.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_bloc/common_audio_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';

const String audioUrl =
    "https://www.soundhelix.com/examples/mp3/SoundHelix-Song-1.mp3";

class CommonAudioPlayer extends StatelessWidget {
  const CommonAudioPlayer({super.key, required this.tools});

  final Widget tools;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CommonAudioBloc, CommonAudioState>(
      listener: (context, state) {
        // TODO: implement listener
        if (state is Error) {
          CommonMethods.showToast(msg: state.error);
        }
      },
      child: BlocSelector<CommonAudioBloc, CommonAudioState, String>(
        selector: (state) => state.commonBlocStateModel.fileUrl,
        builder: (context, state) {
          if (state.isEmpty) {
            return Center(
              child: CommonButton(
                  onTap: () => onFileSelection(context),
                  buttonText: "Select File"),
            );
          } else {
            return BlocSelector<CommonAudioBloc, CommonAudioState, bool>(
              selector: (state) => state.commonBlocStateModel.isLoading,
              builder: (context, state) {
                if (state) {
                  return const CommonProgressIndicator();
                }
                return AudioPlayerWithSlider(tools: tools);
              },
            );
          }
        },
      ),
    );
  }

  /// File selection event
  void onFileSelection(BuildContext context) {
    BlocProvider.of<CommonAudioBloc>(context).add(const CommonAudioPickFile());
  }
}

class AudioPlayerWithSlider extends StatelessWidget {
  const AudioPlayerWithSlider({
    super.key,
    required this.tools,
  });

  final Widget tools;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          decoration: BoxDecoration(
            color: Colors.grey.shade700,
            gradient: LinearGradient(colors: [
              ColorUtils.themeColor1,
              Colors.black12,
              ColorUtils.themeColor1,
              ColorUtils.themeColor2,
              ColorUtils.themeColor1,
              Colors.black12,
              ColorUtils.themeColor1,
            ]),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Column(
            spacing: 5.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.music_note_rounded,
                size: 50.h,
                color: ColorUtils.commonButtonTextColor,
              ),
              const MusicSlider(),
              const PlayPauseButton(),
            ],
          ),
        ),
        BlocSelector<CommonAudioBloc, CommonAudioState, String>(
            selector: (state) => state.commonBlocStateModel.fileUrl, builder: (context,state){
              return Visibility(
                  visible: state.isNotEmpty,
                  replacement: const SizedBox(),
                  child: Text(state.split("/").last,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 34.sp,
                        fontWeight: FontWeight.w600),
                  ),
              );
        }),
        tools,
      ],
    );
  }
}

class PlayPauseButton extends StatelessWidget {
  const PlayPauseButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CommonAudioBloc, CommonAudioState, bool>(
      selector: (state) => state.commonBlocStateModel.isPlayingNow,
      builder: (context, state) =>
          IconButton(
            icon: Icon(
              state ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30.h,
            ),
            onPressed: () {
              BlocProvider.of<CommonAudioBloc>(context)
                  .add(
                  state ? const CommonAudioPause() : const CommonAudioPlay());
            },
          ),
    );
  }
}

class MusicSlider extends StatelessWidget {
  const MusicSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BlocSelector<CommonAudioBloc, CommonAudioState, CommonBlocStateModel>(
          selector: (state) => state.commonBlocStateModel,
          builder: (context, state) {
            return Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.white,
              value: state.position.inSeconds.toDouble(),
              min: 0,
              max: state.totalDuration.inSeconds.toDouble(),
              onChanged: (value) {
                BlocProvider.of<CommonAudioBloc>(context).add(
                  CommonAudioSetSliderValue(
                      position: Duration(seconds: value.toInt())),
                );
              },
              onChangeEnd: (value) {
                BlocProvider.of<CommonAudioBloc>(context).add(
                  CommonAudioSeek(position: Duration(seconds: value.toInt())),
                );
              },
            );
          },
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 48.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BlocSelector<CommonAudioBloc, CommonAudioState, Duration>(
                selector: (state) => state.commonBlocStateModel.position,
                builder: (context, state) {
                  final hours = state.inHours % 24;
                  final minutes = state.inMinutes % 60;
                  final seconds = state.inSeconds % 60;

                  return Text(
                    "${hours.toString().padLeft(2, '0')}:${minutes.toString()
                        .padLeft(2, '0')}:${seconds.toString().padLeft(
                        2, '0')}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900),
                  );
                },
              ),
              BlocSelector<CommonAudioBloc, CommonAudioState, Duration>(
                selector: (state) => state.commonBlocStateModel.totalDuration,
                builder: (context, state) {
                  final hours = state.inHours % 24;
                  final minutes = state.inMinutes % 60;
                  final seconds = state.inSeconds % 60;

                  return Text(
                    "${hours.toString().padLeft(2, '0')}:${minutes.toString()
                        .padLeft(2, '0')}:${seconds.toString().padLeft(
                        2, '0')}",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.sp,
                        fontWeight: FontWeight.w900),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}
