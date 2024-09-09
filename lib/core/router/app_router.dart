import 'package:auto_route/auto_route.dart';
import 'package:trim_pro/feature/home/presentation/home_screen.dart';
part 'app_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: Home.page,path: '/home_screen',initial: true),
  ];
}