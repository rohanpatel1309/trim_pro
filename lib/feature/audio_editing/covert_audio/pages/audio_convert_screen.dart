import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/core/app_utils/common_styles.dart';
import 'package:trim_pro/feature/audio_editing/covert_audio/bloc/audio_convert_screen_bloc.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_dropdown.dart';
import 'package:trim_pro/feature/common_widgets/common_file_selection_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';

@RoutePage(name: 'audioConvert')
class AudioConvertScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioConvertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Audio Format Convert",
      child: ScreenChildren(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => GetIt.instance<AudioConvertScreenBloc>(),
      child: this,
    );
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AudioConvertScreenBloc, AudioConvertScreenState>(
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
              BlocSelector<AudioConvertScreenBloc,
                  AudioConvertScreenState,
                  String>(
                selector: (state) => state.audioConvertBlocStateModel.filePath,
                builder: (context, state) {
                  return CommonFileSelectionButton(
                    onTap: () =>
                        BlocProvider.of<AudioConvertScreenBloc>(context)
                            .add(const PickFile()),
                    buttonText: 'Select File',
                    fileName: state,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 15.w,
                children: [
                  Text(
                    "Format:  ",
                    style: CommonStyles.commonLabelStyle,
                  ),
                  BlocSelector<AudioConvertScreenBloc, AudioConvertScreenState, String>(
                    selector: (state) => state.audioConvertBlocStateModel.extension,
                    builder: (context, state) {
                      return CommonDropDown(
                          value: state,
                          items: const [
                            'AAC',
                            'AC3',
                            'AIF (AIFF)',
                            'AIFC',
                            'AIFF',
                            'AMR',
                            'AU',
                            'CAF',
                            'DTS',
                            'FLAC',
                            'MP2',
                            'MP3',
                            'M4A',
                            'M4B',
                            'OGA',
                            'OGG',
                            'RA',
                            'VOC',
                            'WAV',
                            'WMA',
                          ],
                          onChange: (String? val) {
                            BlocProvider.of<AudioConvertScreenBloc>(context)
                                .add(UpdateExtension(extension: val!));
                          });
                    },
                  ),
                ],
              ),
              BlocSelector<AudioConvertScreenBloc,
                  AudioConvertScreenState,
                  bool>(
                selector: (state) => state.audioConvertBlocStateModel.isLoading,
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: state,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 15.w,
                      children: [
                        CommonButton(
                          onTap: () =>
                              BlocProvider.of<AudioConvertScreenBloc>(context)
                                  .add(const ConvertFile()),
                          buttonText: 'Convert',
                        ),
                        CommonButton(
                          onTap: () =>
                              BlocProvider.of<AudioConvertScreenBloc>(context)
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
          BlocSelector<AudioConvertScreenBloc, AudioConvertScreenState, bool>(
            selector: (state) => state.audioConvertBlocStateModel.isLoading,
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
