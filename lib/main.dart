import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trim_pro/core/app_utils/bloc_observer.dart';
import 'package:trim_pro/core/dependecy_injection/injection.dart';
import 'package:trim_pro/core/router/app_router.dart';

void main() async {
  runZonedGuarded(()  {
    WidgetsFlutterBinding.ensureInitialized();

    configureDependencies();
    Bloc.observer = AppBlocObserver();
    runApp(MyApp());
  }, (error, stack) {
    print("error : $error");
    print("error : $stack");
  });
}
class MyApp extends StatelessWidget {
   MyApp({super.key});

  /// create an instance of `AppRouter`
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(
      MediaQuery.sizeOf(context).height
      , MediaQuery.sizeOf(context).width),
      builder: (context,child) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        builder: (context, widget) {
          return MediaQuery(
            ///Setting font does not change with system font size
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1.0)),
            child: widget!,
          );
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black45),
          useMaterial3: true,
        ),
        routerConfig: _appRouter.config(),
      ),
    );
  }
}

