import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_audio_bloc.dart'
    as common_audio_bloc;
import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/split_audio/presentation/bloc/audio_split_screen_bloc.dart'
    as audio_split_bloc;
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';
import 'package:trim_pro/feature/common_widgets/common_time_fields.dart';

@RoutePage(name: 'audioSplit')
class AudioSplitScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioSplitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Audio Split",
      child: ScreenChildren(),
    );
    ;
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => GetIt.instance<common_audio_bloc.CommonAudioBloc>()),
      BlocProvider(
          create: (_) =>
              GetIt.instance<audio_split_bloc.AudioSplitScreenBloc>())
    ], child: this);
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<common_audio_bloc.CommonAudioBloc,
            common_audio_bloc.CommonAudioState>(listener: (context, state) {
          if (state is common_audio_bloc.SetAudioFileUrl) {
            BlocProvider.of<audio_split_bloc.AudioSplitScreenBloc>(context)
                .add(audio_split_bloc.SetFileParameters(
              filePath: state.url,
              totalDuration: state.totalDuration,
            ));
          }
        }),
        BlocListener<audio_split_bloc.AudioSplitScreenBloc,
            audio_split_bloc.AudioSplitScreenState>(listener: (context, state) {
          if (state is audio_split_bloc.Error) {
            CommonMethods.showToast(
              msg: state.error,
            );
          } else if (state is audio_split_bloc.Completed) {
            if (state.no == 0) {
              CommonMethods.showToast(msg: "Please Save File");
            } else if (state.no == 1) {
              CommonMethods.showToast(msg: "File1 Saved Successfully");
            } else {
              CommonMethods.showToast(msg: "File2 Saved Successfully");
            }
          }
        }),
      ],
      child: Stack(
        children: [
          ListView(
            children: const [
              CommonAudioPlayer(
                tools: AudioSplitScreenFields(),
              ),
            ],
          ),
          BlocSelector<audio_split_bloc.AudioSplitScreenBloc,
              audio_split_bloc.AudioSplitScreenState, bool>(
            selector: (state) => state.audioSplitBlocStateModel.isLoading,
            builder: (context, state) {
              return Visibility(
                visible: state,
                child: const CommonProgressIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Audio Split screen fields
class AudioSplitScreenFields extends StatefulWidget {
  const AudioSplitScreenFields({super.key});

  @override
  State<AudioSplitScreenFields> createState() => _AudioSplitScreenFieldsState();
}

class _AudioSplitScreenFieldsState extends State<AudioSplitScreenFields> {
  TextEditingController splitAtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: BlocSelector<audio_split_bloc.AudioSplitScreenBloc,
          audio_split_bloc.AudioSplitScreenState, bool>(
        selector: (state) => state.audioSplitBlocStateModel.isLoading,
        builder: (context, state) {
          return IgnorePointer(
            ignoring: state,
            child: Column(
              spacing: 20.h,
              children: [
                BlocSelector<audio_split_bloc.AudioSplitScreenBloc,
                    audio_split_bloc.AudioSplitScreenState, bool>(
                  selector: (state) => state is audio_split_bloc.Completed,
                  builder: (context, state) {
                    return Column(
                      spacing: 10.h,
                      children: [
                        Visibility(
                          visible: state,
                          replacement: Column(
                            spacing: 10.h,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Split At: ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 48.sp,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    width: 250.w,
                                    child: TimeTextFormField(
                                      controller: splitAtController,
                                    ),
                                  ),
                                ],
                              ),
                              CommonButton(
                                onTap: () => BlocProvider.of<
                                        audio_split_bloc
                                        .AudioSplitScreenBloc>(context)
                                    .add(audio_split_bloc.SplitAudio(
                                        splitAt:
                                            splitAtController.text.trim())),
                                buttonText: '  Split  ',
                              ),
                            ],
                          ),
                          child: Column(
                            spacing: 10.h,
                            children: [
                              Text(
                                "Save splitted files",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 48.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                spacing: 35.w,
                                children: [
                                  CommonButton(
                                      onTap: () => BlocProvider.of<
                                              audio_split_bloc
                                              .AudioSplitScreenBloc>(context)
                                          .add(const audio_split_bloc
                                              .SaveFile1()),
                                      buttonText: "Save File 1"),
                                  CommonButton(
                                      onTap: () => BlocProvider.of<
                                              audio_split_bloc
                                              .AudioSplitScreenBloc>(context)
                                          .add(const audio_split_bloc
                                              .SaveFile2()),
                                      buttonText: "Save File 2"),
                                ],
                              )
                            ],
                          ),
                        ),
                        CommonButton(
                            onTap: () {
                              BlocProvider.of<
                                      audio_split_bloc
                                      .AudioSplitScreenBloc>(context)
                                  .add(const audio_split_bloc.Reset());
                              BlocProvider.of<
                                      common_audio_bloc
                                      .CommonAudioBloc>(context)
                                  .add(const common_audio_bloc.ResetFile());
                            },
                            buttonText: "Reset")
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
