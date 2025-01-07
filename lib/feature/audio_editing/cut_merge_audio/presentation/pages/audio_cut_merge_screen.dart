import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart';

@RoutePage(name: 'audioCutMerge')
class AudioCutMergeScreen extends StatelessWidget {
  const AudioCutMergeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(titleText: "Audio Cut & Merge",child: ScreenChildren(),);
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AudioCutScreenBloc>(),
      child:  Column(
        children: [
          CommonButton(onTap: (){}, buttonText: 'Select File', ),
        ],
      ),
    );
  }
}