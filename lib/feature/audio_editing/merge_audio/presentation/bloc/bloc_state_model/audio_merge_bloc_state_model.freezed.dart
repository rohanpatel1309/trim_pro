// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_merge_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioMergeBlocStateModel {
  String get fileUrl1 => throw _privateConstructorUsedError;
  String get fileUrl2 => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AudioMergeBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioMergeBlocStateModelCopyWith<AudioMergeBlocStateModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioMergeBlocStateModelCopyWith<$Res> {
  factory $AudioMergeBlocStateModelCopyWith(AudioMergeBlocStateModel value,
          $Res Function(AudioMergeBlocStateModel) then) =
      _$AudioMergeBlocStateModelCopyWithImpl<$Res, AudioMergeBlocStateModel>;
  @useResult
  $Res call({String fileUrl1, String fileUrl2, bool isLoading});
}

/// @nodoc
class _$AudioMergeBlocStateModelCopyWithImpl<$Res,
        $Val extends AudioMergeBlocStateModel>
    implements $AudioMergeBlocStateModelCopyWith<$Res> {
  _$AudioMergeBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioMergeBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl1 = null,
    Object? fileUrl2 = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      fileUrl1: null == fileUrl1
          ? _value.fileUrl1
          : fileUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl2: null == fileUrl2
          ? _value.fileUrl2
          : fileUrl2 // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioMergeBlocStateModelImplCopyWith<$Res>
    implements $AudioMergeBlocStateModelCopyWith<$Res> {
  factory _$$AudioMergeBlocStateModelImplCopyWith(
          _$AudioMergeBlocStateModelImpl value,
          $Res Function(_$AudioMergeBlocStateModelImpl) then) =
      __$$AudioMergeBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String fileUrl1, String fileUrl2, bool isLoading});
}

/// @nodoc
class __$$AudioMergeBlocStateModelImplCopyWithImpl<$Res>
    extends _$AudioMergeBlocStateModelCopyWithImpl<$Res,
        _$AudioMergeBlocStateModelImpl>
    implements _$$AudioMergeBlocStateModelImplCopyWith<$Res> {
  __$$AudioMergeBlocStateModelImplCopyWithImpl(
      _$AudioMergeBlocStateModelImpl _value,
      $Res Function(_$AudioMergeBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioMergeBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? fileUrl1 = null,
    Object? fileUrl2 = null,
    Object? isLoading = null,
  }) {
    return _then(_$AudioMergeBlocStateModelImpl(
      fileUrl1: null == fileUrl1
          ? _value.fileUrl1
          : fileUrl1 // ignore: cast_nullable_to_non_nullable
              as String,
      fileUrl2: null == fileUrl2
          ? _value.fileUrl2
          : fileUrl2 // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AudioMergeBlocStateModelImpl implements _AudioMergeBlocStateModel {
  const _$AudioMergeBlocStateModelImpl(
      {this.fileUrl1 = "", this.fileUrl2 = "", this.isLoading = false});

  @override
  @JsonKey()
  final String fileUrl1;
  @override
  @JsonKey()
  final String fileUrl2;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AudioMergeBlocStateModel(fileUrl1: $fileUrl1, fileUrl2: $fileUrl2, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioMergeBlocStateModelImpl &&
            (identical(other.fileUrl1, fileUrl1) ||
                other.fileUrl1 == fileUrl1) &&
            (identical(other.fileUrl2, fileUrl2) ||
                other.fileUrl2 == fileUrl2) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fileUrl1, fileUrl2, isLoading);

  /// Create a copy of AudioMergeBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioMergeBlocStateModelImplCopyWith<_$AudioMergeBlocStateModelImpl>
      get copyWith => __$$AudioMergeBlocStateModelImplCopyWithImpl<
          _$AudioMergeBlocStateModelImpl>(this, _$identity);
}

abstract class _AudioMergeBlocStateModel implements AudioMergeBlocStateModel {
  const factory _AudioMergeBlocStateModel(
      {final String fileUrl1,
      final String fileUrl2,
      final bool isLoading}) = _$AudioMergeBlocStateModelImpl;

  @override
  String get fileUrl1;
  @override
  String get fileUrl2;
  @override
  bool get isLoading;

  /// Create a copy of AudioMergeBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioMergeBlocStateModelImplCopyWith<_$AudioMergeBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
