import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';
import 'package:trim_pro/core/router/app_router.dart';
import 'package:trim_pro/feature/home/presentation/bloc/home_screen_bloc.dart';
import 'package:trim_pro/feature/home/presentation/widgets/common_button.dart';
import 'package:trim_pro/feature/home/presentation/widgets/selection_button.dart';

@RoutePage(name: 'home')
class HomeScreen extends StatelessWidget implements AutoRouteWrapper {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Home",
      child: ScreenChildren(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomeScreenBloc>(
      create: (_) => GetIt.instance<HomeScreenBloc>(),
      child: this,
    );
  }
}

/// Audio Editing
class ScreenChildren extends StatelessWidget {
  const ScreenChildren({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(
        horizontal: 10.w,
      ),
      children: [
        BlocSelector<HomeScreenBloc, HomeScreenState, int>(
          selector: (state) => state.index,
          builder: (context, state) {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 35.w,
                  children: [
                    SelectionButton(
                      isSelected: state == 0,
                      onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                          .add(const SetIndex(index: 0)),
                      text: "Audio Editing",
                    ),
                    SelectionButton(
                      isSelected: state == 1,
                      onTap: () => BlocProvider.of<HomeScreenBloc>(context)
                          .add(const SetIndex(index: 1)),
                      text: "Video Editing",
                    ),
                  ],
                ),
                Visibility(
                  visible: state == 0,
                  replacement: const VideoEditingWidget(),
                  child: const AudioEditingWidget(),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

/// Audio Editing
class AudioEditingWidget extends StatelessWidget {
  const AudioEditingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          children: [
            CommonButton(
              icon: CupertinoIcons.scissors_alt,
              text: "Cut",
              onTap: () => context.router.pushNamed(AppRouter.audioCutScreen),
            ),
            CommonButton(
              icon: Icons.merge,
              text: "Merge",
              onTap: () => context.router.pushNamed(AppRouter.audioMergeScreen),
            ),
            CommonButton(
              icon: Icons.all_inclusive,
              text: "Cut & Merge",
              onTap: () =>
                  context.router.pushNamed(AppRouter.audioCutMergeScreen),
            ),
            CommonButton(
              icon: Icons.call_split,
              text: "Split",
              onTap: () => context.router.pushNamed(AppRouter.audioSplitScreen),
            ),
            CommonButton(
              icon: Icons.input,
              text: "Insert",
              onTap: () =>
                  context.router.pushNamed(AppRouter.audioInsertScreen),
            ),
            CommonButton(
              icon: Icons.speed_outlined,
              text: "Speed",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.volume_down,
              text: "Volume",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.change_circle,
              text: "Convert\nFormat",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.multitrack_audio_rounded,
              text: "Mix Track",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.keyboard_backspace,
              text: "Reverse",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.loop,
              text: "Loop",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.speaker_phone,
              text: "Normalize",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.noise_aware,
              text: "Remove\nSilence",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.gradient,
              text: "Fade",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.text_fields,
              text: "Text to Audio",
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}

/// Video Editing
class VideoEditingWidget extends StatelessWidget {
  const VideoEditingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10.h,
        ),
        Wrap(
          children: [
            CommonButton(
              icon: CupertinoIcons.scissors_alt,
              text: "Cut",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.merge,
              text: "Merge",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.all_inclusive,
              text: "Cut & Merge",
              onTap: () =>
                  context.router.pushNamed(AppRouter.audioCutMergeScreen),
            ),
            CommonButton(
              icon: Icons.call_split,
              text: "Split",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.input,
              text: "Insert",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.image,
              text: "Extract\nFrames",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.water,
              text: "Add\nWatermark",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.music_note,
              text: "Extract\nAudio",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.photo_size_select_small,
              text: "Resize",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.change_circle,
              text: "Convert\nFormat",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.keyboard_backspace,
              text: "Reverse",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.speed,
              text: "Speed\nChange",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.rotate_right,
              text: "Rotate",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.loop,
              text: "Loop",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.subtitles,
              text: "Add\nSubtitles",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.blur_on,
              text: "Blur",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.video_library,
              text: "Overlay",
              onTap: () {},
            ),
            CommonButton(
              icon: Icons.audiotrack,
              text: "Add\nAudio",
              onTap: () {
                // Logic to open a screen or execute the FFmpeg command
              },
            ),
          ],
        ),
      ],
    );
  }
}
