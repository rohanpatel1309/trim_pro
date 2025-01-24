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
    return Column(
          children: [

            Expanded(
              child: ListView(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                children: const [
                  AudioEditingWidget(),
                ],
              ),
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
              onTap: () => context.router.pushNamed(AppRouter.audioSpeedScreen),
            ),

            CommonButton(
              icon: Icons.change_circle,
              text: "Convert\nFormat",
              onTap: () => context.router.pushNamed(AppRouter.audioConvertScreen),
            ),
          ],
        ),
      ],
    );
  }
}

