import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/router/app_router.dart';
import 'package:trim_pro/feature/home/presentation/widgets/common_button.dart';

@RoutePage(name: 'home')
class HomeScreen extends StatelessWidget{
  const HomeScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      child: ScreenChildren(),
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
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      children: [
        const AudioEditingWidget(),
        SizedBox(
          height: 30.h,
        ),
        const VideoEditingWidget(),
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
        Row(
          children: [
            Icon(
              Icons.audiotrack,
              size: 20.h,
              color: Colors.white,
            ),
            Text(
              "Audio Editing",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
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
              onTap: () => context.router.pushNamed(AppRouter.audioCutMergeScreen),
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
        Row(
          children: [
            Icon(
              Icons.audiotrack,
              size: 20.h,
              color: Colors.white,
            ),
            Text(
              "Video Editing",
              style: TextStyle(
                  fontSize: 20.sp,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
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
          ],
        ),
      ],
    );
  }
}
