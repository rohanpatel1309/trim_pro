import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/core/app_utils/color_utils.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/merge_audio/presentation/bloc/audio_merge_screen_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_file_selection_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';

@RoutePage(name: 'audioMerge')
class AudioMergeScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioMergeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Audio Merge",
      child: ScreenChildren(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<AudioMergeScreenBloc>(),
      child: this,
    );
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioMergeScreenBloc, AudioMergeScreenState>(
      listener: (context, state) {
        if (state is Error) {
          CommonMethods.showToast(msg: state.error);
        } else if (state is Completed) {
          CommonMethods.showToast(
            msg: "File saved successfully.",
          );
        }
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            spacing: 20.h,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, String>(
                selector: (state) => state.audioMergeBlocStateModel.fileUrl1,
                builder: (context, state) {
                  return CommonFileSelectionButton(
                    onTap: () => BlocProvider.of<AudioMergeScreenBloc>(context)
                        .add(const PickFile(fileNo: 1)),
                    buttonText: 'Select File 1',
                    fileName: state,
                  );
                },
              ),
              BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, String>(
                selector: (state) => state.audioMergeBlocStateModel.fileUrl2,
                builder: (context, state) {
                  return CommonFileSelectionButton(
                    onTap: () => BlocProvider.of<AudioMergeScreenBloc>(context)
                        .add(const PickFile(fileNo: 2)),
                    buttonText: 'Select File 2',
                    fileName: state,
                  );
                },
              ),
              BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, bool>(
                selector: (state) => state.audioMergeBlocStateModel.isLoading,
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: state,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        CommonButton(
                          onTap: () =>
                              BlocProvider.of<AudioMergeScreenBloc>(context)
                                  .add(const MergeFile()),
                          buttonText: 'Merge',
                        ),
                        CommonButton(
                          onTap: () =>
                              BlocProvider.of<AudioMergeScreenBloc>(context)
                                  .add(const Reset()),
                          buttonText: 'Reset',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
          BlocSelector<AudioMergeScreenBloc, AudioMergeScreenState, bool>(
            selector: (state) => state.audioMergeBlocStateModel.isLoading,
            builder: (context, state) {
              return Visibility(
                  visible: state, child: const CommonProgressIndicator());
            },
          ),
        ],
      ),
    );
  }
}
