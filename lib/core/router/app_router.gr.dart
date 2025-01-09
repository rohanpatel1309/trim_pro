// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AudioCutMergeScreen]
class AudioCutMerge extends PageRouteInfo<void> {
  const AudioCutMerge({List<PageRouteInfo>? children})
      : super(
          AudioCutMerge.name,
          initialChildren: children,
        );

  static const String name = 'AudioCutMerge';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AudioCutMergeScreen();
    },
  );
}

/// generated route for
/// [AudioCutScreen]
class AudioCut extends PageRouteInfo<void> {
  const AudioCut({List<PageRouteInfo>? children})
      : super(
          AudioCut.name,
          initialChildren: children,
        );

  static const String name = 'AudioCut';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AudioCutScreen());
    },
  );
}

/// generated route for
/// [AudioInsertScreen]
class AudioInsert extends PageRouteInfo<void> {
  const AudioInsert({List<PageRouteInfo>? children})
      : super(
          AudioInsert.name,
          initialChildren: children,
        );

  static const String name = 'AudioInsert';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AudioInsertScreen());
    },
  );
}

/// generated route for
/// [AudioMergeScreen]
class AudioMerge extends PageRouteInfo<void> {
  const AudioMerge({List<PageRouteInfo>? children})
      : super(
          AudioMerge.name,
          initialChildren: children,
        );

  static const String name = 'AudioMerge';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const AudioMergeScreen());
    },
  );
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home({List<PageRouteInfo>? children})
      : super(
          Home.name,
          initialChildren: children,
        );

  static const String name = 'Home';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const HomeScreen();
    },
  );
}
