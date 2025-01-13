import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

part 'home_screen_event.dart';
part 'home_screen_state.dart';

@injectable
class HomeScreenBloc extends Bloc<HomeScreenEvent, HomeScreenState> {
  HomeScreenBloc() : super(const HomeScreenState(index: 0)) {
    on<SetIndex>(_onSetIndex);
  }

  /// Set index
  void _onSetIndex(SetIndex event , Emitter<HomeScreenState> emit){
    // 0 = Audio Editing
    // 1 = Video Editing
    emit(HomeScreenState(index: event.index));
  }
}
