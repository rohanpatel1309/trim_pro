// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioEventCopyWith<$Res> {
  factory $AudioEventCopyWith(
          AudioEvent value, $Res Function(AudioEvent) then) =
      _$AudioEventCopyWithImpl<$Res, AudioEvent>;
}

/// @nodoc
class _$AudioEventCopyWithImpl<$Res, $Val extends AudioEvent>
    implements $AudioEventCopyWith<$Res> {
  _$AudioEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$PlayImplCopyWith<$Res> {
  factory _$$PlayImplCopyWith(
          _$PlayImpl value, $Res Function(_$PlayImpl) then) =
      __$$PlayImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PlayImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$PlayImpl>
    implements _$$PlayImplCopyWith<$Res> {
  __$$PlayImplCopyWithImpl(_$PlayImpl _value, $Res Function(_$PlayImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PlayImpl implements _Play {
  const _$PlayImpl();

  @override
  String toString() {
    return 'AudioEvent.play()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PlayImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) {
    return play();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) {
    return play?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) {
    return play(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) {
    return play?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) {
    if (play != null) {
      return play(this);
    }
    return orElse();
  }
}

abstract class _Play implements AudioEvent {
  const factory _Play() = _$PlayImpl;
}

/// @nodoc
abstract class _$$PauseImplCopyWith<$Res> {
  factory _$$PauseImplCopyWith(
          _$PauseImpl value, $Res Function(_$PauseImpl) then) =
      __$$PauseImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PauseImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$PauseImpl>
    implements _$$PauseImplCopyWith<$Res> {
  __$$PauseImplCopyWithImpl(
      _$PauseImpl _value, $Res Function(_$PauseImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PauseImpl implements _Pause {
  const _$PauseImpl();

  @override
  String toString() {
    return 'AudioEvent.pause()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PauseImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) {
    return pause();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) {
    return pause?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) {
    return pause(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) {
    return pause?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) {
    if (pause != null) {
      return pause(this);
    }
    return orElse();
  }
}

abstract class _Pause implements AudioEvent {
  const factory _Pause() = _$PauseImpl;
}

/// @nodoc
abstract class _$$SeekImplCopyWith<$Res> {
  factory _$$SeekImplCopyWith(
          _$SeekImpl value, $Res Function(_$SeekImpl) then) =
      __$$SeekImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$SeekImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$SeekImpl>
    implements _$$SeekImplCopyWith<$Res> {
  __$$SeekImplCopyWithImpl(_$SeekImpl _value, $Res Function(_$SeekImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$SeekImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$SeekImpl implements _Seek {
  const _$SeekImpl({required this.position});

  @override
  final Duration position;

  @override
  String toString() {
    return 'AudioEvent.seek(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeekImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SeekImplCopyWith<_$SeekImpl> get copyWith =>
      __$$SeekImplCopyWithImpl<_$SeekImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) {
    return seek(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) {
    return seek?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) {
    if (seek != null) {
      return seek(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) {
    return seek(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) {
    return seek?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) {
    if (seek != null) {
      return seek(this);
    }
    return orElse();
  }
}

abstract class _Seek implements AudioEvent {
  const factory _Seek({required final Duration position}) = _$SeekImpl;

  Duration get position;

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SeekImplCopyWith<_$SeekImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PickFileImplCopyWith<$Res> {
  factory _$$PickFileImplCopyWith(
          _$PickFileImpl value, $Res Function(_$PickFileImpl) then) =
      __$$PickFileImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$PickFileImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$PickFileImpl>
    implements _$$PickFileImplCopyWith<$Res> {
  __$$PickFileImplCopyWithImpl(
      _$PickFileImpl _value, $Res Function(_$PickFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$PickFileImpl implements _PickFile {
  const _$PickFileImpl();

  @override
  String toString() {
    return 'AudioEvent.pickFile()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$PickFileImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) {
    return pickFile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) {
    return pickFile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) {
    if (pickFile != null) {
      return pickFile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) {
    return pickFile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) {
    return pickFile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) {
    if (pickFile != null) {
      return pickFile(this);
    }
    return orElse();
  }
}

abstract class _PickFile implements AudioEvent {
  const factory _PickFile() = _$PickFileImpl;
}

/// @nodoc
abstract class _$$SetSliderValueImplCopyWith<$Res> {
  factory _$$SetSliderValueImplCopyWith(_$SetSliderValueImpl value,
          $Res Function(_$SetSliderValueImpl) then) =
      __$$SetSliderValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Duration position});
}

/// @nodoc
class __$$SetSliderValueImplCopyWithImpl<$Res>
    extends _$AudioEventCopyWithImpl<$Res, _$SetSliderValueImpl>
    implements _$$SetSliderValueImplCopyWith<$Res> {
  __$$SetSliderValueImplCopyWithImpl(
      _$SetSliderValueImpl _value, $Res Function(_$SetSliderValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? position = null,
  }) {
    return _then(_$SetSliderValueImpl(
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$SetSliderValueImpl implements _SetSliderValue {
  const _$SetSliderValueImpl({required this.position});

  @override
  final Duration position;

  @override
  String toString() {
    return 'AudioEvent.setSliderValue(position: $position)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetSliderValueImpl &&
            (identical(other.position, position) ||
                other.position == position));
  }

  @override
  int get hashCode => Object.hash(runtimeType, position);

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetSliderValueImplCopyWith<_$SetSliderValueImpl> get copyWith =>
      __$$SetSliderValueImplCopyWithImpl<_$SetSliderValueImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() play,
    required TResult Function() pause,
    required TResult Function(Duration position) seek,
    required TResult Function() pickFile,
    required TResult Function(Duration position) setSliderValue,
  }) {
    return setSliderValue(position);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? play,
    TResult? Function()? pause,
    TResult? Function(Duration position)? seek,
    TResult? Function()? pickFile,
    TResult? Function(Duration position)? setSliderValue,
  }) {
    return setSliderValue?.call(position);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? play,
    TResult Function()? pause,
    TResult Function(Duration position)? seek,
    TResult Function()? pickFile,
    TResult Function(Duration position)? setSliderValue,
    required TResult orElse(),
  }) {
    if (setSliderValue != null) {
      return setSliderValue(position);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Play value) play,
    required TResult Function(_Pause value) pause,
    required TResult Function(_Seek value) seek,
    required TResult Function(_PickFile value) pickFile,
    required TResult Function(_SetSliderValue value) setSliderValue,
  }) {
    return setSliderValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Play value)? play,
    TResult? Function(_Pause value)? pause,
    TResult? Function(_Seek value)? seek,
    TResult? Function(_PickFile value)? pickFile,
    TResult? Function(_SetSliderValue value)? setSliderValue,
  }) {
    return setSliderValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Play value)? play,
    TResult Function(_Pause value)? pause,
    TResult Function(_Seek value)? seek,
    TResult Function(_PickFile value)? pickFile,
    TResult Function(_SetSliderValue value)? setSliderValue,
    required TResult orElse(),
  }) {
    if (setSliderValue != null) {
      return setSliderValue(this);
    }
    return orElse();
  }
}

abstract class _SetSliderValue implements AudioEvent {
  const factory _SetSliderValue({required final Duration position}) =
      _$SetSliderValueImpl;

  Duration get position;

  /// Create a copy of AudioEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetSliderValueImplCopyWith<_$SetSliderValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AudioState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioStateCopyWith<$Res> {
  factory $AudioStateCopyWith(
          AudioState value, $Res Function(AudioState) then) =
      _$AudioStateCopyWithImpl<$Res, AudioState>;
}

/// @nodoc
class _$AudioStateCopyWithImpl<$Res, $Val extends AudioState>
    implements $AudioStateCopyWith<$Res> {
  _$AudioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'AudioState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AudioState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'AudioState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements AudioState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$SetUrlImplCopyWith<$Res> {
  factory _$$SetUrlImplCopyWith(
          _$SetUrlImpl value, $Res Function(_$SetUrlImpl) then) =
      __$$SetUrlImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonBlocDataModel commonBlocDataModel});
}

/// @nodoc
class __$$SetUrlImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$SetUrlImpl>
    implements _$$SetUrlImplCopyWith<$Res> {
  __$$SetUrlImplCopyWithImpl(
      _$SetUrlImpl _value, $Res Function(_$SetUrlImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonBlocDataModel = null,
  }) {
    return _then(_$SetUrlImpl(
      commonBlocDataModel: null == commonBlocDataModel
          ? _value.commonBlocDataModel
          : commonBlocDataModel // ignore: cast_nullable_to_non_nullable
              as CommonBlocDataModel,
    ));
  }
}

/// @nodoc

class _$SetUrlImpl implements _SetUrl {
  const _$SetUrlImpl({required this.commonBlocDataModel});

  @override
  final CommonBlocDataModel commonBlocDataModel;

  @override
  String toString() {
    return 'AudioState.setUrl(commonBlocDataModel: $commonBlocDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetUrlImpl &&
            (identical(other.commonBlocDataModel, commonBlocDataModel) ||
                other.commonBlocDataModel == commonBlocDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commonBlocDataModel);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetUrlImplCopyWith<_$SetUrlImpl> get copyWith =>
      __$$SetUrlImplCopyWithImpl<_$SetUrlImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return setUrl(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return setUrl?.call(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (setUrl != null) {
      return setUrl(commonBlocDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return setUrl(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return setUrl?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (setUrl != null) {
      return setUrl(this);
    }
    return orElse();
  }
}

abstract class _SetUrl implements AudioState {
  const factory _SetUrl(
      {required final CommonBlocDataModel commonBlocDataModel}) = _$SetUrlImpl;

  CommonBlocDataModel get commonBlocDataModel;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetUrlImplCopyWith<_$SetUrlImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PlayingImplCopyWith<$Res> {
  factory _$$PlayingImplCopyWith(
          _$PlayingImpl value, $Res Function(_$PlayingImpl) then) =
      __$$PlayingImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonBlocDataModel commonBlocDataModel});
}

/// @nodoc
class __$$PlayingImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$PlayingImpl>
    implements _$$PlayingImplCopyWith<$Res> {
  __$$PlayingImplCopyWithImpl(
      _$PlayingImpl _value, $Res Function(_$PlayingImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonBlocDataModel = null,
  }) {
    return _then(_$PlayingImpl(
      commonBlocDataModel: null == commonBlocDataModel
          ? _value.commonBlocDataModel
          : commonBlocDataModel // ignore: cast_nullable_to_non_nullable
              as CommonBlocDataModel,
    ));
  }
}

/// @nodoc

class _$PlayingImpl implements _Playing {
  const _$PlayingImpl({required this.commonBlocDataModel});

  @override
  final CommonBlocDataModel commonBlocDataModel;

  @override
  String toString() {
    return 'AudioState.playing(commonBlocDataModel: $commonBlocDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayingImpl &&
            (identical(other.commonBlocDataModel, commonBlocDataModel) ||
                other.commonBlocDataModel == commonBlocDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commonBlocDataModel);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayingImplCopyWith<_$PlayingImpl> get copyWith =>
      __$$PlayingImplCopyWithImpl<_$PlayingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return playing(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return playing?.call(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(commonBlocDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return playing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return playing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (playing != null) {
      return playing(this);
    }
    return orElse();
  }
}

abstract class _Playing implements AudioState {
  const factory _Playing(
      {required final CommonBlocDataModel commonBlocDataModel}) = _$PlayingImpl;

  CommonBlocDataModel get commonBlocDataModel;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PlayingImplCopyWith<_$PlayingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$PausedImplCopyWith<$Res> {
  factory _$$PausedImplCopyWith(
          _$PausedImpl value, $Res Function(_$PausedImpl) then) =
      __$$PausedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonBlocDataModel commonBlocDataModel});
}

/// @nodoc
class __$$PausedImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$PausedImpl>
    implements _$$PausedImplCopyWith<$Res> {
  __$$PausedImplCopyWithImpl(
      _$PausedImpl _value, $Res Function(_$PausedImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonBlocDataModel = null,
  }) {
    return _then(_$PausedImpl(
      commonBlocDataModel: null == commonBlocDataModel
          ? _value.commonBlocDataModel
          : commonBlocDataModel // ignore: cast_nullable_to_non_nullable
              as CommonBlocDataModel,
    ));
  }
}

/// @nodoc

class _$PausedImpl implements _Paused {
  const _$PausedImpl({required this.commonBlocDataModel});

  @override
  final CommonBlocDataModel commonBlocDataModel;

  @override
  String toString() {
    return 'AudioState.paused(commonBlocDataModel: $commonBlocDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PausedImpl &&
            (identical(other.commonBlocDataModel, commonBlocDataModel) ||
                other.commonBlocDataModel == commonBlocDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commonBlocDataModel);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PausedImplCopyWith<_$PausedImpl> get copyWith =>
      __$$PausedImplCopyWithImpl<_$PausedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return paused(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return paused?.call(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(commonBlocDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return paused(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return paused?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (paused != null) {
      return paused(this);
    }
    return orElse();
  }
}

abstract class _Paused implements AudioState {
  const factory _Paused(
      {required final CommonBlocDataModel commonBlocDataModel}) = _$PausedImpl;

  CommonBlocDataModel get commonBlocDataModel;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PausedImplCopyWith<_$PausedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetPositionImplCopyWith<$Res> {
  factory _$$SetPositionImplCopyWith(
          _$SetPositionImpl value, $Res Function(_$SetPositionImpl) then) =
      __$$SetPositionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonBlocDataModel commonBlocDataModel});
}

/// @nodoc
class __$$SetPositionImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$SetPositionImpl>
    implements _$$SetPositionImplCopyWith<$Res> {
  __$$SetPositionImplCopyWithImpl(
      _$SetPositionImpl _value, $Res Function(_$SetPositionImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonBlocDataModel = null,
  }) {
    return _then(_$SetPositionImpl(
      commonBlocDataModel: null == commonBlocDataModel
          ? _value.commonBlocDataModel
          : commonBlocDataModel // ignore: cast_nullable_to_non_nullable
              as CommonBlocDataModel,
    ));
  }
}

/// @nodoc

class _$SetPositionImpl implements _SetPosition {
  const _$SetPositionImpl({required this.commonBlocDataModel});

  @override
  final CommonBlocDataModel commonBlocDataModel;

  @override
  String toString() {
    return 'AudioState.setPosition(commonBlocDataModel: $commonBlocDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPositionImpl &&
            (identical(other.commonBlocDataModel, commonBlocDataModel) ||
                other.commonBlocDataModel == commonBlocDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commonBlocDataModel);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPositionImplCopyWith<_$SetPositionImpl> get copyWith =>
      __$$SetPositionImplCopyWithImpl<_$SetPositionImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return setPosition(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return setPosition?.call(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(commonBlocDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return setPosition(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return setPosition?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (setPosition != null) {
      return setPosition(this);
    }
    return orElse();
  }
}

abstract class _SetPosition implements AudioState {
  const factory _SetPosition(
          {required final CommonBlocDataModel commonBlocDataModel}) =
      _$SetPositionImpl;

  CommonBlocDataModel get commonBlocDataModel;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SetPositionImplCopyWith<_$SetPositionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ErrorImplCopyWith<$Res> {
  factory _$$ErrorImplCopyWith(
          _$ErrorImpl value, $Res Function(_$ErrorImpl) then) =
      __$$ErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$ErrorImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$ErrorImpl>
    implements _$$ErrorImplCopyWith<$Res> {
  __$$ErrorImplCopyWithImpl(
      _$ErrorImpl _value, $Res Function(_$ErrorImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$ErrorImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ErrorImpl implements _Error {
  const _$ErrorImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'AudioState.error(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ErrorImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      __$$ErrorImplCopyWithImpl<_$ErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements AudioState {
  const factory _Error(final String error) = _$ErrorImpl;

  String get error;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ErrorImplCopyWith<_$ErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdateSliderValueImplCopyWith<$Res> {
  factory _$$UpdateSliderValueImplCopyWith(_$UpdateSliderValueImpl value,
          $Res Function(_$UpdateSliderValueImpl) then) =
      __$$UpdateSliderValueImplCopyWithImpl<$Res>;
  @useResult
  $Res call({CommonBlocDataModel commonBlocDataModel});
}

/// @nodoc
class __$$UpdateSliderValueImplCopyWithImpl<$Res>
    extends _$AudioStateCopyWithImpl<$Res, _$UpdateSliderValueImpl>
    implements _$$UpdateSliderValueImplCopyWith<$Res> {
  __$$UpdateSliderValueImplCopyWithImpl(_$UpdateSliderValueImpl _value,
      $Res Function(_$UpdateSliderValueImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? commonBlocDataModel = null,
  }) {
    return _then(_$UpdateSliderValueImpl(
      commonBlocDataModel: null == commonBlocDataModel
          ? _value.commonBlocDataModel
          : commonBlocDataModel // ignore: cast_nullable_to_non_nullable
              as CommonBlocDataModel,
    ));
  }
}

/// @nodoc

class _$UpdateSliderValueImpl implements _UpdateSliderValue {
  const _$UpdateSliderValueImpl({required this.commonBlocDataModel});

  @override
  final CommonBlocDataModel commonBlocDataModel;

  @override
  String toString() {
    return 'AudioState.updateSliderValue(commonBlocDataModel: $commonBlocDataModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdateSliderValueImpl &&
            (identical(other.commonBlocDataModel, commonBlocDataModel) ||
                other.commonBlocDataModel == commonBlocDataModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, commonBlocDataModel);

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdateSliderValueImplCopyWith<_$UpdateSliderValueImpl> get copyWith =>
      __$$UpdateSliderValueImplCopyWithImpl<_$UpdateSliderValueImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) setUrl,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) playing,
    required TResult Function(CommonBlocDataModel commonBlocDataModel) paused,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        setPosition,
    required TResult Function(String error) error,
    required TResult Function(CommonBlocDataModel commonBlocDataModel)
        updateSliderValue,
  }) {
    return updateSliderValue(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult? Function(String error)? error,
    TResult? Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
  }) {
    return updateSliderValue?.call(commonBlocDataModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setUrl,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? playing,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? paused,
    TResult Function(CommonBlocDataModel commonBlocDataModel)? setPosition,
    TResult Function(String error)? error,
    TResult Function(CommonBlocDataModel commonBlocDataModel)?
        updateSliderValue,
    required TResult orElse(),
  }) {
    if (updateSliderValue != null) {
      return updateSliderValue(commonBlocDataModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_SetUrl value) setUrl,
    required TResult Function(_Playing value) playing,
    required TResult Function(_Paused value) paused,
    required TResult Function(_SetPosition value) setPosition,
    required TResult Function(_Error value) error,
    required TResult Function(_UpdateSliderValue value) updateSliderValue,
  }) {
    return updateSliderValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_SetUrl value)? setUrl,
    TResult? Function(_Playing value)? playing,
    TResult? Function(_Paused value)? paused,
    TResult? Function(_SetPosition value)? setPosition,
    TResult? Function(_Error value)? error,
    TResult? Function(_UpdateSliderValue value)? updateSliderValue,
  }) {
    return updateSliderValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_SetUrl value)? setUrl,
    TResult Function(_Playing value)? playing,
    TResult Function(_Paused value)? paused,
    TResult Function(_SetPosition value)? setPosition,
    TResult Function(_Error value)? error,
    TResult Function(_UpdateSliderValue value)? updateSliderValue,
    required TResult orElse(),
  }) {
    if (updateSliderValue != null) {
      return updateSliderValue(this);
    }
    return orElse();
  }
}

abstract class _UpdateSliderValue implements AudioState {
  const factory _UpdateSliderValue(
          {required final CommonBlocDataModel commonBlocDataModel}) =
      _$UpdateSliderValueImpl;

  CommonBlocDataModel get commonBlocDataModel;

  /// Create a copy of AudioState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdateSliderValueImplCopyWith<_$UpdateSliderValueImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
