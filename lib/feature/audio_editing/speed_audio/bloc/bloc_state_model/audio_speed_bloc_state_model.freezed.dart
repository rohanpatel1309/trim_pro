// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_speed_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioSpeedBlocStateModel {
  String get speed => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AudioSpeedBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioSpeedBlocStateModelCopyWith<AudioSpeedBlocStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioSpeedBlocStateModelCopyWith<$Res> {
  factory $AudioSpeedBlocStateModelCopyWith(AudioSpeedBlocStateModel value,
          $Res Function(AudioSpeedBlocStateModel) then) =
      _$AudioSpeedBlocStateModelCopyWithImpl<$Res, AudioSpeedBlocStateModel>;
  @useResult
  $Res call({String speed, String filePath, bool isLoading});
}

/// @nodoc
class _$AudioSpeedBlocStateModelCopyWithImpl<$Res,
        $Val extends AudioSpeedBlocStateModel>
    implements $AudioSpeedBlocStateModelCopyWith<$Res> {
  _$AudioSpeedBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioSpeedBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? filePath = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioSpeedBlocStateModelImplCopyWith<$Res>
    implements $AudioSpeedBlocStateModelCopyWith<$Res> {
  factory _$$AudioSpeedBlocStateModelImplCopyWith(
          _$AudioSpeedBlocStateModelImpl value,
          $Res Function(_$AudioSpeedBlocStateModelImpl) then) =
      __$$AudioSpeedBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String speed, String filePath, bool isLoading});
}

/// @nodoc
class __$$AudioSpeedBlocStateModelImplCopyWithImpl<$Res>
    extends _$AudioSpeedBlocStateModelCopyWithImpl<$Res,
        _$AudioSpeedBlocStateModelImpl>
    implements _$$AudioSpeedBlocStateModelImplCopyWith<$Res> {
  __$$AudioSpeedBlocStateModelImplCopyWithImpl(
      _$AudioSpeedBlocStateModelImpl _value,
      $Res Function(_$AudioSpeedBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioSpeedBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? speed = null,
    Object? filePath = null,
    Object? isLoading = null,
  }) {
    return _then(_$AudioSpeedBlocStateModelImpl(
      speed: null == speed
          ? _value.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AudioSpeedBlocStateModelImpl implements _AudioSpeedBlocStateModel {
  const _$AudioSpeedBlocStateModelImpl(
      {this.speed = "1.0x", this.filePath = "", this.isLoading = false});

  @override
  @JsonKey()
  final String speed;
  @override
  @JsonKey()
  final String filePath;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AudioSpeedBlocStateModel(speed: $speed, filePath: $filePath, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioSpeedBlocStateModelImpl &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, speed, filePath, isLoading);

  /// Create a copy of AudioSpeedBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioSpeedBlocStateModelImplCopyWith<_$AudioSpeedBlocStateModelImpl>
      get copyWith => __$$AudioSpeedBlocStateModelImplCopyWithImpl<
          _$AudioSpeedBlocStateModelImpl>(this, _$identity);
}

abstract class _AudioSpeedBlocStateModel implements AudioSpeedBlocStateModel {
  const factory _AudioSpeedBlocStateModel(
      {final String speed,
      final String filePath,
      final bool isLoading}) = _$AudioSpeedBlocStateModelImpl;

  @override
  String get speed;
  @override
  String get filePath;
  @override
  bool get isLoading;

  /// Create a copy of AudioSpeedBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioSpeedBlocStateModelImplCopyWith<_$AudioSpeedBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
