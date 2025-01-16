import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:trim_pro/core/app_utils/app_background.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:trim_pro/feature/audio_editing/common_widgets/common_bloc/common_audio_bloc.dart'    as common_audio_bloc;

import 'package:trim_pro/feature/audio_editing/common_widgets/common_audio_player.dart';
import 'package:trim_pro/feature/audio_editing/insert_audio/presentation/bloc/audio_insert_screen_bloc.dart'
    as audio_insert_bloc;
import 'package:trim_pro/feature/common_widgets/common_button.dart';
import 'package:trim_pro/feature/common_widgets/common_file_selection_button.dart';
import 'package:trim_pro/feature/common_widgets/common_progress_indicator.dart';
import 'package:trim_pro/feature/common_widgets/common_time_fields.dart';

@RoutePage(name: 'audioInsert')
class AudioInsertScreen extends StatelessWidget implements AutoRouteWrapper {
  const AudioInsertScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppBackground(
        titleText: "Audio Insert", child: ScreenChildren());
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    // TODO: implement wrappedRoute
    return MultiBlocProvider(providers: [
      BlocProvider<common_audio_bloc.CommonAudioBloc>(
          create: (_) => GetIt.instance<common_audio_bloc.CommonAudioBloc>()),
      BlocProvider<audio_insert_bloc.AudioInsertScreenBloc>(
          create: (_) =>
              GetIt.instance<audio_insert_bloc.AudioInsertScreenBloc>()),
    ], child: this);
  }
}

class ScreenChildren extends StatelessWidget {
  const ScreenChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<audio_insert_bloc.AudioInsertScreenBloc,
            audio_insert_bloc.AudioInsertScreenState>(
          listener: (context, state) {
            if (state is audio_insert_bloc.Error) {
              CommonMethods.showToast(msg: state.error);
            } else if (state is audio_insert_bloc.Completed) {
              CommonMethods.showToast(
                msg: "File saved successfully.",
              );
              context.router.back();
            }

          },
        ),
        BlocListener<common_audio_bloc.CommonAudioBloc,
            common_audio_bloc.CommonAudioState>(listener: (context, state) {
          if (state is common_audio_bloc.SetAudioFileUrl) {
            BlocProvider.of<audio_insert_bloc.AudioInsertScreenBloc>(context)
                .add(audio_insert_bloc.SetFileParameters(
              filePath: state.url,
              totalDuration: state.totalDuration,
            ));
          }
        }),
      ],
      child: Stack(
        children: [
          ListView(
            children: const [
              CommonAudioPlayer(
                tools: AudioInsertScreenFields(),
              ),
            ],
          ),
          BlocSelector<audio_insert_bloc.AudioInsertScreenBloc,
              audio_insert_bloc.AudioInsertScreenState, bool>(
            selector: (state) => state.audioInsertBlocStateModel.isLoading,
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

/// Audio Insert screen fields
class AudioInsertScreenFields extends StatefulWidget {
  const AudioInsertScreenFields({super.key});

  @override
  State<AudioInsertScreenFields> createState() => _AudioInsertScreenFieldsState();
}

class _AudioInsertScreenFieldsState extends State<AudioInsertScreenFields> {
  TextEditingController insertAtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<audio_insert_bloc.AudioInsertScreenBloc, audio_insert_bloc.AudioInsertScreenState, bool>(
  selector: (state) => state.audioInsertBlocStateModel.isLoading,
  builder: (context, state) {
    return IgnorePointer(
      ignoring: state,
      child: Padding(
        padding: EdgeInsets.only(top: 12.h),
        child: Column(
          spacing: 20.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Insert At: ",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 48.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  width: 250.w,
                  child: TimeTextFormField(
                    controller: insertAtController,
                  ),
                ),
              ],
            ),
            BlocSelector<audio_insert_bloc.AudioInsertScreenBloc,
                audio_insert_bloc.AudioInsertScreenState, String>(
              selector: (state) => state.audioInsertBlocStateModel.fileUrl,
              builder: (context, state) {
                return CommonFileSelectionButton(
                  onTap: () =>
                      BlocProvider.of<audio_insert_bloc.AudioInsertScreenBloc>(
                              context)
                          .add(audio_insert_bloc.PickFile()),
                  buttonText: 'Select File',
                  fileName: state,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 15.w,
              children: [
                CommonButton(
                  onTap: () =>
                      BlocProvider.of<audio_insert_bloc.AudioInsertScreenBloc>(
                              context)
                          .add(audio_insert_bloc.InsertAudio(
                              insertAt: insertAtController.text.trim())),
                  buttonText: 'Insert',
                ),
                CommonButton(
                  onTap: () {
                    BlocProvider.of<audio_insert_bloc.AudioInsertScreenBloc>(
                        context)
                        .add(const audio_insert_bloc.Reset());
                    BlocProvider.of<common_audio_bloc.CommonAudioBloc>(context).add(const common_audio_bloc.ResetFile());

                  },
                  buttonText: 'Reset',
                ),
              ],
            )
          ],
        ),
      ),
    );
  },
);
  }
}
