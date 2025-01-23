// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_insert_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioInsertBlocStateModel {
  bool get isLoading => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;

  /// Create a copy of AudioInsertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioInsertBlocStateModelCopyWith<AudioInsertBlocStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioInsertBlocStateModelCopyWith<$Res> {
  factory $AudioInsertBlocStateModelCopyWith(AudioInsertBlocStateModel value,
          $Res Function(AudioInsertBlocStateModel) then) =
      _$AudioInsertBlocStateModelCopyWithImpl<$Res, AudioInsertBlocStateModel>;
  @useResult
  $Res call({bool isLoading, String fileUrl, Duration totalDuration});
}

/// @nodoc
class _$AudioInsertBlocStateModelCopyWithImpl<$Res,
        $Val extends AudioInsertBlocStateModel>
    implements $AudioInsertBlocStateModelCopyWith<$Res> {
  _$AudioInsertBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioInsertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? fileUrl = null,
    Object? totalDuration = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioInsertBlocStateModelImplCopyWith<$Res>
    implements $AudioInsertBlocStateModelCopyWith<$Res> {
  factory _$$AudioInsertBlocStateModelImplCopyWith(
          _$AudioInsertBlocStateModelImpl value,
          $Res Function(_$AudioInsertBlocStateModelImpl) then) =
      __$$AudioInsertBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLoading, String fileUrl, Duration totalDuration});
}

/// @nodoc
class __$$AudioInsertBlocStateModelImplCopyWithImpl<$Res>
    extends _$AudioInsertBlocStateModelCopyWithImpl<$Res,
        _$AudioInsertBlocStateModelImpl>
    implements _$$AudioInsertBlocStateModelImplCopyWith<$Res> {
  __$$AudioInsertBlocStateModelImplCopyWithImpl(
      _$AudioInsertBlocStateModelImpl _value,
      $Res Function(_$AudioInsertBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioInsertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? fileUrl = null,
    Object? totalDuration = null,
  }) {
    return _then(_$AudioInsertBlocStateModelImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$AudioInsertBlocStateModelImpl implements _AudioInsertBlocStateModel {
  const _$AudioInsertBlocStateModelImpl(
      {this.isLoading = false,
      this.fileUrl = "",
      this.totalDuration = const Duration()});

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String fileUrl;
  @override
  @JsonKey()
  final Duration totalDuration;

  @override
  String toString() {
    return 'AudioInsertBlocStateModel(isLoading: $isLoading, fileUrl: $fileUrl, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioInsertBlocStateModelImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isLoading, fileUrl, totalDuration);

  /// Create a copy of AudioInsertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioInsertBlocStateModelImplCopyWith<_$AudioInsertBlocStateModelImpl>
      get copyWith => __$$AudioInsertBlocStateModelImplCopyWithImpl<
          _$AudioInsertBlocStateModelImpl>(this, _$identity);
}

abstract class _AudioInsertBlocStateModel implements AudioInsertBlocStateModel {
  const factory _AudioInsertBlocStateModel(
      {final bool isLoading,
      final String fileUrl,
      final Duration totalDuration}) = _$AudioInsertBlocStateModelImpl;

  @override
  bool get isLoading;
  @override
  String get fileUrl;
  @override
  Duration get totalDuration;

  /// Create a copy of AudioInsertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioInsertBlocStateModelImplCopyWith<_$AudioInsertBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
