import 'package:auto_route/auto_route.dart';
import 'package:trim_pro/feature/audio_editing/covert_audio/pages/audio_convert_screen.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/pages/audio_cut_screen.dart';
import 'package:trim_pro/feature/audio_editing/cut_merge_audio/presentation/pages/audio_cut_merge_screen.dart';
import 'package:trim_pro/feature/audio_editing/insert_audio/presentation/pages/audio_insert_screen.dart';
import 'package:trim_pro/feature/audio_editing/speed_audio/pages/audio_speed_screen.dart';
import 'package:trim_pro/feature/audio_editing/split_audio/presentation/pages/audio_split_screen.dart';
import 'package:trim_pro/feature/home/presentation/pages/home_screen.dart';

import '../../feature/audio_editing/merge_audio/presentation/pages/audio_merge_screen.dart';
part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  static const String homeScreen = '/home_screen';
  static const String audioCutScreen = '/audio_cut_screen';
  static const String audioMergeScreen = '/audio_merge_screen';
  static const String audioInsertScreen = '/audio_insert_screen';
  static const String audioCutMergeScreen = '/audio_cut_merge_screen';
  static const String audioSplitScreen = '/audio_split_screen';
  static const String audioSpeedScreen = '/audio_speed_screen';
  static const String audioConvertScreen = '/audio_convert_screen';

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Home.page,path: homeScreen,initial: true),
    AutoRoute(page: AudioCut.page,path: audioCutScreen),
    AutoRoute(page: AudioMerge.page,path: audioMergeScreen),
    AutoRoute(page: AudioCutMerge.page,path: audioCutMergeScreen),
    AutoRoute(page: AudioInsert.page,path: audioInsertScreen),
    AutoRoute(page: AudioSplit.page,path: audioSplitScreen),
    AutoRoute(page: AudioSpeed.page,path: audioSpeedScreen),
    AutoRoute(page: AudioConvert.page,path: audioConvertScreen),
  ];
}