import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart';

@RoutePage(name: 'audioMerge')
class AudioMergeScreen extends StatelessWidget {
  const AudioMergeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(titleText: "Audio Merge",child: ScreenChildren(),);
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AudioCutScreenBloc>(),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CommonButton(onTap: (){}, buttonText: 'Select File 1', ),
          SizedBox(height: 20.h,),
          CommonButton(onTap: (){}, buttonText: 'Select File 2', ),

        ],
      ),
    );
  }
}

