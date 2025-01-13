part of 'home_screen_bloc.dart';

final class HomeScreenState extends Equatable {
  // 0 = Audio Editing
  // 1 = Video Editing

  final int index;

  const HomeScreenState({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index];
}

