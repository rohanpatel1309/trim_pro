import 'package:auto_route/auto_route.dart';
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/pages/audio_cut_screen.dart';
import 'package:trim_pro/feature/home/presentation/pages/home_screen.dart';

import '../../feature/audio_editing/merge_audio/presentation/pages/audio_merge_screen.dart';
part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {

  static const String homeScreen = '/home_screen';
  static const String audioCutScreen = '/audio_cut_screen';
  static const String audioMergeScreen = '/audio_merge_screen';

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Home.page,path: homeScreen,initial: true),
    AutoRoute(page: AudioCut.page,path: audioCutScreen),
    AutoRoute(page: AudioMerge.page,path: audioMergeScreen),
  ];
}