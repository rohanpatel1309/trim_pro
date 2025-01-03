import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/bloc_state_model/common_bloc_state_model.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_audio_bloc.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_button.dart';

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
        if (state.commonBlocStateModel.error.isNotEmpty) {
          CommonMethods.showToast(msg: state.commonBlocStateModel.error);
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
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  );
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.music_note_rounded,
          size: 50.h,
          color: Colors.white,
        ),
        Column(
          children: [
            BlocSelector<CommonAudioBloc, CommonAudioState,
                CommonBlocStateModel>(
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
                      CommonAudioSeek(
                          position: Duration(seconds: value.toInt())),
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
                        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                        style: TextStyle(color: Colors.white, fontSize: 26.sp),
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
                        "${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
                        style: TextStyle(color: Colors.white, fontSize: 26.sp),
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
        BlocSelector<CommonAudioBloc, CommonAudioState, bool>(
          selector: (state) => state.commonBlocStateModel.isPlayingNow,
          builder: (context, data) => IconButton(
            icon: Icon(
              data ? Icons.pause : Icons.play_arrow,
              color: Colors.white,
              size: 30.h,
            ),
            onPressed: () {
              BlocProvider.of<CommonAudioBloc>(context).add(
                  data ? const CommonAudioPause() : const CommonAudioPlay());
            },
          ),
        ),
        SizedBox(
          height: 40.h,
        ),
        tools,
      ],
    );
  }
}
