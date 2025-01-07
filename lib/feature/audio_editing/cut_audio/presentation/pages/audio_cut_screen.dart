import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_bloc/common_audio_bloc.dart'
as common_audio_bloc;
import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';
import 'package:trim_pro/feature/common_widgets/common_time_fields.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart'
as audio_cut_bloc;

@RoutePage(name: 'audioCut')
class AudioCutScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioCutScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider<common_audio_bloc.CommonAudioBloc>(
          create: (_) => GetIt.instance<common_audio_bloc.CommonAudioBloc>()),
      BlocProvider<audio_cut_bloc.AudioCutScreenBloc>(
          create: (_) => GetIt.instance<audio_cut_bloc.AudioCutScreenBloc>()),
    ], child: this);
  }

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
      titleText: "Audio Cut", child: ScreenChildren(),);
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
            BlocProvider.of<audio_cut_bloc.AudioCutScreenBloc>(context)
                .add(audio_cut_bloc.SetFileParameters(
              filePath: state.url,
              totalDuration: state.totalDuration,
            ));
          }
        }),
        BlocListener<audio_cut_bloc.AudioCutScreenBloc,
            audio_cut_bloc.AudioCutScreenState>(listener: (context, state) {
          if (state is audio_cut_bloc.Error) {
            CommonMethods.showToast(
              msg: state.error,
            );
          } else if (state is audio_cut_bloc.Completed) {
            CommonMethods.showToast(
              msg: "File saved successfully.",
            );
            context.router.back();
          }
        }),
      ],
      child: Stack(
        children: [
          ListView(
            children: const [
              CommonAudioPlayer(
                tools: AudioCutScreenFields(),
              ),
            ],
          ),
          BlocSelector<audio_cut_bloc.AudioCutScreenBloc,
              audio_cut_bloc.AudioCutScreenState,
              bool>(
              selector: (state) => state.audioCutBlocStateModel.isLoading,
              builder: (context, state) {
                return state
                    ? Padding(
                  padding: EdgeInsets.only(bottom: 60.h),
                  child: const CommonProgressIndicator(),
                )
                    : const SizedBox();
              })
        ],
      ),
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
    return Padding(
      padding: EdgeInsets.only(top: 12.h),
      child: Column(
        children: [
          TimeFields(
            controller1: startController,
            controller2: endController,
            title1: "Start",
            title2: "  End",
          ),
          SizedBox(
            height: 40.h,
          ),
          BlocSelector<audio_cut_bloc.AudioCutScreenBloc, audio_cut_bloc.AudioCutScreenState, bool>(
            selector: (state) => state.audioCutBlocStateModel.isLoading,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state,
                child: CommonButton(
                  onTap: () {
                    BlocProvider.of<audio_cut_bloc.AudioCutScreenBloc>(context)
                        .add(
                        audio_cut_bloc.CutAudio(
                            start: startController.text.trim(),
                            end: endController.text.trim()));
                  },
                  buttonText: '  Cut  ',
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
