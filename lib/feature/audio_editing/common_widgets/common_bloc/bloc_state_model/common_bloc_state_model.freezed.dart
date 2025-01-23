// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'common_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CommonBlocStateModel {
  bool get isPlayingNow => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get fileUrl => throw _privateConstructorUsedError;
  Duration get position => throw _privateConstructorUsedError;
  Duration get totalDuration => throw _privateConstructorUsedError;

  /// Create a copy of CommonBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommonBlocStateModelCopyWith<CommonBlocStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommonBlocStateModelCopyWith<$Res> {
  factory $CommonBlocStateModelCopyWith(CommonBlocStateModel value,
          $Res Function(CommonBlocStateModel) then) =
      _$CommonBlocStateModelCopyWithImpl<$Res, CommonBlocStateModel>;
  @useResult
  $Res call(
      {bool isPlayingNow,
      bool isLoading,
      String fileUrl,
      Duration position,
      Duration totalDuration});
}

/// @nodoc
class _$CommonBlocStateModelCopyWithImpl<$Res,
        $Val extends CommonBlocStateModel>
    implements $CommonBlocStateModelCopyWith<$Res> {
  _$CommonBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommonBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayingNow = null,
    Object? isLoading = null,
    Object? fileUrl = null,
    Object? position = null,
    Object? totalDuration = null,
  }) {
    return _then(_value.copyWith(
      isPlayingNow: null == isPlayingNow
          ? _value.isPlayingNow
          : isPlayingNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommonBlocStateModelImplCopyWith<$Res>
    implements $CommonBlocStateModelCopyWith<$Res> {
  factory _$$CommonBlocStateModelImplCopyWith(_$CommonBlocStateModelImpl value,
          $Res Function(_$CommonBlocStateModelImpl) then) =
      __$$CommonBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isPlayingNow,
      bool isLoading,
      String fileUrl,
      Duration position,
      Duration totalDuration});
}

/// @nodoc
class __$$CommonBlocStateModelImplCopyWithImpl<$Res>
    extends _$CommonBlocStateModelCopyWithImpl<$Res, _$CommonBlocStateModelImpl>
    implements _$$CommonBlocStateModelImplCopyWith<$Res> {
  __$$CommonBlocStateModelImplCopyWithImpl(_$CommonBlocStateModelImpl _value,
      $Res Function(_$CommonBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommonBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPlayingNow = null,
    Object? isLoading = null,
    Object? fileUrl = null,
    Object? position = null,
    Object? totalDuration = null,
  }) {
    return _then(_$CommonBlocStateModelImpl(
      isPlayingNow: null == isPlayingNow
          ? _value.isPlayingNow
          : isPlayingNow // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      fileUrl: null == fileUrl
          ? _value.fileUrl
          : fileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      position: null == position
          ? _value.position
          : position // ignore: cast_nullable_to_non_nullable
              as Duration,
      totalDuration: null == totalDuration
          ? _value.totalDuration
          : totalDuration // ignore: cast_nullable_to_non_nullable
              as Duration,
    ));
  }
}

/// @nodoc

class _$CommonBlocStateModelImpl implements _CommonBlocStateModel {
  const _$CommonBlocStateModelImpl(
      {this.isPlayingNow = false,
      this.isLoading = false,
      this.fileUrl = "",
      this.position = const Duration(seconds: 0),
      this.totalDuration = const Duration(seconds: 0)});

  @override
  @JsonKey()
  final bool isPlayingNow;
  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final String fileUrl;
  @override
  @JsonKey()
  final Duration position;
  @override
  @JsonKey()
  final Duration totalDuration;

  @override
  String toString() {
    return 'CommonBlocStateModel(isPlayingNow: $isPlayingNow, isLoading: $isLoading, fileUrl: $fileUrl, position: $position, totalDuration: $totalDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommonBlocStateModelImpl &&
            (identical(other.isPlayingNow, isPlayingNow) ||
                other.isPlayingNow == isPlayingNow) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.fileUrl, fileUrl) || other.fileUrl == fileUrl) &&
            (identical(other.position, position) ||
                other.position == position) &&
            (identical(other.totalDuration, totalDuration) ||
                other.totalDuration == totalDuration));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, isPlayingNow, isLoading, fileUrl, position, totalDuration);

  /// Create a copy of CommonBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommonBlocStateModelImplCopyWith<_$CommonBlocStateModelImpl>
      get copyWith =>
          __$$CommonBlocStateModelImplCopyWithImpl<_$CommonBlocStateModelImpl>(
              this, _$identity);
}

abstract class _CommonBlocStateModel implements CommonBlocStateModel {
  const factory _CommonBlocStateModel(
      {final bool isPlayingNow,
      final bool isLoading,
      final String fileUrl,
      final Duration position,
      final Duration totalDuration}) = _$CommonBlocStateModelImpl;

  @override
  bool get isPlayingNow;
  @override
  bool get isLoading;
  @override
  String get fileUrl;
  @override
  Duration get position;
  @override
  Duration get totalDuration;

  /// Create a copy of CommonBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommonBlocStateModelImplCopyWith<_$CommonBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
