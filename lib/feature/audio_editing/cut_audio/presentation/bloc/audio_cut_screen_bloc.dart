import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trim_pro/core/app_utils/common_methods.dart';
import 'package:injectable/injectable.dart';


part 'audio_cut_screen_event.dart';
part 'audio_cut_screen_state.dart';
part 'audio_cut_screen_bloc.freezed.dart';

@injectable
class CutScreenBloc extends Bloc<CutScreenEvent, CutScreenState> {
  CutScreenBloc() : super(const CutScreenState.initial()) {
    on<_PickFile>(_onPickFile);
  }

  /// Pick File
  Future<void> _onPickFile(_PickFile event, Emitter<CutScreenState> emit) async {
    await CommonMethods.pickFile();
  }


}

