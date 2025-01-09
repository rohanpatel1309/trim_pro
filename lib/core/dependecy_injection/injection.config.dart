// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:trim_pro/feature/audio_editing/common_bloc/common_audio_bloc.dart'
    as _i679;
import 'package:trim_pro/feature/audio_editing/cut_audio/presentation/bloc/audio_cut_screen_bloc.dart'
    as _i24;
import 'package:trim_pro/feature/audio_editing/insert_audio/bloc/audio_insert_screen_bloc.dart'
    as _i1021;
import 'package:trim_pro/feature/audio_editing/merge_audio/presentation/bloc/audio_merge_screen_bloc.dart'
    as _i698;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i679.CommonAudioBloc>(() => _i679.CommonAudioBloc());
    gh.factory<_i24.AudioCutScreenBloc>(() => _i24.AudioCutScreenBloc());
    gh.factory<_i698.AudioMergeScreenBloc>(() => _i698.AudioMergeScreenBloc());
    gh.factory<_i1021.AudioInsertScreenBloc>(
        () => _i1021.AudioInsertScreenBloc());
    return this;
  }
}
