import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';
import 'package:trim_pro/feature/audio_editing/merge_audio/presentation/bloc/audio_merge_screen_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart';

@RoutePage(name: 'audioMerge')
class AudioMergeScreen extends StatelessWidget {
  const AudioMergeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Audio Merge",
      child: ScreenChildren(),
    );
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<AudioCutScreenBloc>(),
      child: Column(
        spacing: 20.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, String>(
            selector: (state) => state.audioMergeBlocStateModel.fileUrl1,
            builder: (context, state) {
              return CommonFileSelectionButton(
                onTap: () {},
                buttonText: 'Select File 1',
                fileName: state,
              );
            },
          ),
          BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, String>(
            selector: (state) => state.audioMergeBlocStateModel.fileUrl2,
            builder: (context, state) {
              return CommonFileSelectionButton(
                onTap: () {},
                buttonText: 'Select File 2',
                fileName: state,
              );
            },
          ),
          CommonButton(
            onTap: () {},
            buttonText: 'Merge',
          ),
        ],
      ),
    );
  }
}

class CommonFileSelectionButton extends StatelessWidget {
  const CommonFileSelectionButton({
    super.key,
    required this.buttonText,
    required this.onTap,
    required this.fileName,
  });

  final String buttonText;
  final VoidCallback onTap;
  final String fileName;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      children: [
        CommonButton(
          onTap: onTap,
          buttonText: buttonText,
        ),
        Visibility(
          visible: fileName.isNotEmpty,
          child: Text(
            "FileName: $fileName",
            style: TextStyle(
                color: ColorUtils.commonButtonTextColor,
                fontSize: 40.sp,
                fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
