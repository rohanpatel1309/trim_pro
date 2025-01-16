import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_bloc/common_audio_bloc.dart'
    as common_audio_bloc;
import 'package:trim_pro/feature/audio_editing/speed_audio/bloc/audio_speed_screen_bloc.dart'
    as audio_speed_bloc;
import 'package:trim_pro/feature/common_widgets/common_button.dart';

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
          create: (_) => GetIt.instance<audio_speed_bloc.AudioSpeedScreenBloc>())
    ], child: this);
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: const [
            CommonAudioPlayer(
              tools: AudioSpeedScreenFields(),
            ),
          ],
        ),
        // BlocSelector<audio_cut_bloc.AudioCutScreenBloc,
        //     audio_cut_bloc.AudioCutScreenState, bool>(
        //   selector: (state) => state.audioCutBlocStateModel.isLoading,
        //   builder: (context, state) {
        //     return Visibility(
        //       visible: state,
        //       child: const CommonProgressIndicator(),
        //     );
        //   },
        // ),
      ],
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
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 48.sp,
                        fontWeight: FontWeight.w600),
                  ),
                  BlocSelector<audio_speed_bloc.AudioSpeedScreenBloc,
                      audio_speed_bloc.AudioSpeedScreenState, String>(
                    selector: (state) => state.audioSpeedBlocStateModel.speed,
                    builder: (context, state) {
                      return DropdownButtonHideUnderline(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 2),
                            // White border
                            borderRadius: BorderRadius.circular(
                                8), // Rounded corners (optional)
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          // Padding inside the border
                          child: DropdownButton<String>(
                            focusColor: Colors.white,
                            value: state,
                            dropdownColor: Colors.black,
                            // Background color of dropdown items
                            style: TextStyle(
                              color: Colors.white,
                              // Text color of dropdown items
                              fontSize: 40.sp,
                              fontWeight: FontWeight.w700,
                            ),
                            iconEnabledColor: Colors.white,
                            // Icon color
                            items: <String>[
                              '0.5x',
                              '1.0x',
                              '1.5x',
                              '2.5x',
                              '3.0x',
                              '3.5x',
                              '4.0x',
                            ].map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: const TextStyle(
                                      color: Colors.white), // Item text color
                                ),
                              );
                            }).toList(),
                            hint: const Text(
                              "Please choose a speed",
                              style: TextStyle(
                                color: Colors.white, // Hint text color
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            onChanged: (String? value) {
                              BlocProvider.of<
                                      common_audio_bloc
                                      .CommonAudioBloc>(context)
                                  .add(common_audio_bloc.SetAudioSpeed(
                                      speed: double.parse(value!.split("x").first)));
                              BlocProvider.of<
                                      audio_speed_bloc
                                      .AudioSpeedScreenBloc>(context)
                                  .add(audio_speed_bloc.SetAudioSpeed(
                                      speed: value));
                            },
                          ),
                        ),
                      );
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
              CommonButton(onTap: () {}, buttonText: 'Save File'),
              CommonButton(onTap: () {}, buttonText: 'Reset'),
            ],
          )
        ],
      ),
    );
  }
}
