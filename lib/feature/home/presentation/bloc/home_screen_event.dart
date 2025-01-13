part of 'home_screen_bloc.dart';

sealed class HomeScreenEvent extends Equatable {
  const HomeScreenEvent();
}

final class SetIndex extends HomeScreenEvent{
  // 0 = Audio Editing
  // 1 = Video Editing
  final int index;

  const SetIndex({required this.index});
  @override
  // TODO: implement props
  List<Object?> get props => [index];

}