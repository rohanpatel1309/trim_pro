import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/core/app_utils/common_styles.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_bloc/common_audio_bloc.dart'
    as common_audio_bloc;
import 'package:trim_pro/feature/audio_editing/speed_audio/bloc/audio_speed_screen_bloc.dart'
    as audio_speed_bloc;
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_dropdown.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';

@RoutePage(name: 'audioSpeed')
class AudioSpeedScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioSpeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
        titleText: "Audio Speed", child: ScreenChildren());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (_) => GetIt.instance<common_audio_bloc.CommonAudioBloc>()),
      BlocProvider(
          create: (_) =>
              GetIt.instance<audio_speed_bloc.AudioSpeedScreenBloc>())
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
            BlocProvider.of<audio_speed_bloc.AudioSpeedScreenBloc>(context)
                .add(audio_speed_bloc.SetFileParameters(
              filePath: state.url,
            ));
          }
        }),
        BlocListener<audio_speed_bloc.AudioSpeedScreenBloc,
            audio_speed_bloc.AudioSpeedScreenState>(listener: (context, state) {
          if (state is audio_speed_bloc.Error) {
            CommonMethods.showToast(
              msg: state.error,
            );
          } else if (state is audio_speed_bloc.Completed) {
            CommonMethods.showToast(
              msg: "File saved successfully.",
            );
          }
        }),
      ],
      child: Stack(
        children: [
          ListView(
            children: const [
              CommonAudioPlayer(
                tools: AudioSpeedScreenFields(),
              ),
            ],
          ),
          BlocSelector<audio_speed_bloc.AudioSpeedScreenBloc,
              audio_speed_bloc.AudioSpeedScreenState, bool>(
            selector: (state) => state.audioSpeedBlocStateModel.isLoading,
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

/// Audio speed screen fields
class AudioSpeedScreenFields extends StatelessWidget {
  const AudioSpeedScreenFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10.h),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Text(
                    "Speed:  ",
                    style: CommonStyles.commonLabelStyle,
                  ),
                  BlocSelector<audio_speed_bloc.AudioSpeedScreenBloc,
                      audio_speed_bloc.AudioSpeedScreenState, String>(
                    selector: (state) => state.audioSpeedBlocStateModel.speed,
                    builder: (context, state) {
                      return CommonDropDown(
                          value: state,
                          items: const [
                            '0.5x',
                            '1.0x',
                            '1.5x',
                            '2.0x',
                            '2.5x',
                            '3.0x',
                            '3.5x',
                            '4.0x',
                          ],
                          onChange: (String? value) {
                            BlocProvider.of<common_audio_bloc.CommonAudioBloc>(
                                    context)
                                .add(common_audio_bloc.SetAudioSpeed(
                                    speed: double.parse(
                                        value!.replaceAll("x", ""))));
                            BlocProvider.of<
                                    audio_speed_bloc
                                    .AudioSpeedScreenBloc>(context)
                                .add(audio_speed_bloc.SetAudioSpeed(
                                    speed: value));
                          });
                    },
                  ),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 15.w,
            children: [
              CommonButton(
                  onTap: () {
                    BlocProvider.of<audio_speed_bloc.AudioSpeedScreenBloc>(
                            context)
                        .add(const audio_speed_bloc.SaveFile());
                  },
                  buttonText: 'Save File'),
              CommonButton(
                  onTap: () {
                    BlocProvider.of<common_audio_bloc.CommonAudioBloc>(context)
                        .add(const common_audio_bloc.ResetFile());
                    BlocProvider.of<audio_speed_bloc.AudioSpeedScreenBloc>(
                            context)
                        .add(const audio_speed_bloc.Reset());
                  },
                  buttonText: 'Reset'),
            ],
          )
        ],
      ),
    );
  }
}
