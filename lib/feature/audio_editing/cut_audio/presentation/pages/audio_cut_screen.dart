import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_audio_bloc.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_button.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_time_fields.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart';

@RoutePage(name: 'audioCut')
class AudioCutScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioCutScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider<CommonAudioBloc>(create: (_) => GetIt.instance<CommonAudioBloc>()),
      BlocProvider<AudioCutScreenBloc>(
          create: (_) => GetIt.instance<AudioCutScreenBloc>()),
    ], child: this);
  }

  @override
  Widget build(BuildContext context) {
    return const AppBackground(child: ScreenChildren());
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        CommonAudioPlayer(tools: AudioCutScreenFields(),),
      ],
    );
  }
}

/// Audio cut screen fields
class AudioCutScreenFields extends StatefulWidget {
   const AudioCutScreenFields({super.key});

  @override
  State<AudioCutScreenFields> createState() => _AudioCutScreenFieldsState();
}

class _AudioCutScreenFieldsState extends State<AudioCutScreenFields> {
  TextEditingController startController = TextEditingController(),
      endController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TimeFields(
          controller1: startController,
          controller2: endController,
          title1: "Start",
          title2: "End",
        ),
        SizedBox(
          height: 40.h,
        ),
        CommonButton(
          onTap: () => (){},
          buttonText: '  Cut  ',
        ),
      ],
    );
  }
}

