import 'package:auto_route/auto_route.dart';
import 'package:trim_pro/feature/audio_editing/presentation/pages/cut_screen.dart';
import 'package:trim_pro/feature/home/presentation/pages/home_screen.dart';
part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {

  static const String homeScreen = '/home_screen';
  static const String cutScreen = '/cut_screen';

  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Home.page,path: homeScreen,initial: true),
    AutoRoute(page: Cut.page,path: cutScreen),
  ];
}