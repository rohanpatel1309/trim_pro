import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart';
import 'package:trim_pro/feature/audio_editing/widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/widgets/common_button.dart';

@RoutePage(name: 'audioCut')
class AudioCutScreen extends StatelessWidget {
  const AudioCutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(child: ScreenChildren());
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
          const CommonAudioPlayer(),
          CommonButton(onTap:() =>  onFileSelection(context), buttonText: 'Select File', ),
        ],
      ),
    );
  }

  /// File selection event
  void onFileSelection(BuildContext context){
    BlocProvider.of<AudioCutScreenBloc>(context).add(const AudioCutScreenEvent.pickFile());
  }
}