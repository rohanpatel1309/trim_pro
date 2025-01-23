// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_cut_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioCutBlocStateModel {
  bool get isLoading => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;

  /// Create a copy of AudioCutBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioCutBlocStateModelCopyWith<AudioCutBlocStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioCutBlocStateModelCopyWith<$Res> {
  factory $AudioCutBlocStateModelCopyWith(AudioCutBlocStateModel value,
          $Res Function(AudioCutBlocStateModel) then) =
      _$AudioCutBlocStateModelCopyWithImpl<$Res, AudioCutBlocStateModel>;
  @useResult
  $Res call({bool isLoading, String filePath, Duration totalDuration});
}

/// @nodoc
class _$AudioCutBlocStateModelCopyWithImpl<$Res,
        $Val extends AudioCutBlocStateModel>
    implements $AudioCutBlocStateModelCopyWith<$Res> {
  _$AudioCutBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioCutBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filePath = null,
    Object? totalDuration = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioCutBlocStateModelImplCopyWith<$Res>
    implements $AudioCutBlocStateModelCopyWith<$Res> {
  factory _$$AudioCutBlocStateModelImplCopyWith(
          _$AudioCutBlocStateModelImpl value,
          $Res Function(_$AudioCutBlocStateModelImpl) then) =
      __$$AudioCutBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String filePath, Duration totalDuration});
}

/// @nodoc
class __$$AudioCutBlocStateModelImplCopyWithImpl<$Res>
    extends _$AudioCutBlocStateModelCopyWithImpl<$Res,
        _$AudioCutBlocStateModelImpl>
    implements _$$AudioCutBlocStateModelImplCopyWith<$Res> {
  __$$AudioCutBlocStateModelImplCopyWithImpl(
      _$AudioCutBlocStateModelImpl _value,
      $Res Function(_$AudioCutBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioCutBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? filePath = null,
    Object? totalDuration = null,
  }) {
    return _then(_$AudioCutBlocStateModelImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$AudioCutBlocStateModelImpl implements _AudioCutBlocStateModel {
  const _$AudioCutBlocStateModelImpl(
      {this.isLoading = false,
      this.filePath = "",
      this.totalDuration = const Duration()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String filePath;
  @override
  @JsonKey()
  final Duration totalDuration;

  @override
  String toString() {
    return 'AudioCutBlocStateModel(isLoading: $isLoading, filePath: $filePath, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioCutBlocStateModelImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, filePath, totalDuration);

  /// Create a copy of AudioCutBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioCutBlocStateModelImplCopyWith<_$AudioCutBlocStateModelImpl>
      get copyWith => __$$AudioCutBlocStateModelImplCopyWithImpl<
          _$AudioCutBlocStateModelImpl>(this, _$identity);
}

abstract class _AudioCutBlocStateModel implements AudioCutBlocStateModel {
  const factory _AudioCutBlocStateModel(
      {final bool isLoading,
      final String filePath,
      final Duration totalDuration}) = _$AudioCutBlocStateModelImpl;

  @override
  bool get isLoading;
  @override
  String get filePath;
  @override
  Duration get totalDuration;

  /// Create a copy of AudioCutBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioCutBlocStateModelImplCopyWith<_$AudioCutBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
