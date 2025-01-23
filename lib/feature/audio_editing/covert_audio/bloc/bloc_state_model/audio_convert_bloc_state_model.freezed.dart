// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_convert_bloc_state_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AudioConvertBlocStateModel {
  String get filePath => throw _privateConstructorUsedError;
  String get extension => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Create a copy of AudioConvertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AudioConvertBlocStateModelCopyWith<AudioConvertBlocStateModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioConvertBlocStateModelCopyWith<$Res> {
  factory $AudioConvertBlocStateModelCopyWith(AudioConvertBlocStateModel value,
          $Res Function(AudioConvertBlocStateModel) then) =
      _$AudioConvertBlocStateModelCopyWithImpl<$Res,
          AudioConvertBlocStateModel>;
  @useResult
  $Res call({String filePath, String extension, bool isLoading});
}

/// @nodoc
class _$AudioConvertBlocStateModelCopyWithImpl<$Res,
        $Val extends AudioConvertBlocStateModel>
    implements $AudioConvertBlocStateModelCopyWith<$Res> {
  _$AudioConvertBlocStateModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AudioConvertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? extension = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AudioConvertBlocStateModelImplCopyWith<$Res>
    implements $AudioConvertBlocStateModelCopyWith<$Res> {
  factory _$$AudioConvertBlocStateModelImplCopyWith(
          _$AudioConvertBlocStateModelImpl value,
          $Res Function(_$AudioConvertBlocStateModelImpl) then) =
      __$$AudioConvertBlocStateModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String filePath, String extension, bool isLoading});
}

/// @nodoc
class __$$AudioConvertBlocStateModelImplCopyWithImpl<$Res>
    extends _$AudioConvertBlocStateModelCopyWithImpl<$Res,
        _$AudioConvertBlocStateModelImpl>
    implements _$$AudioConvertBlocStateModelImplCopyWith<$Res> {
  __$$AudioConvertBlocStateModelImplCopyWithImpl(
      _$AudioConvertBlocStateModelImpl _value,
      $Res Function(_$AudioConvertBlocStateModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of AudioConvertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filePath = null,
    Object? extension = null,
    Object? isLoading = null,
  }) {
    return _then(_$AudioConvertBlocStateModelImpl(
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      extension: null == extension
          ? _value.extension
          : extension // ignore: cast_nullable_to_non_nullable
              as String,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AudioConvertBlocStateModelImpl implements _AudioConvertBlocStateModel {
  const _$AudioConvertBlocStateModelImpl(
      {this.filePath = "", this.extension = "MP3", this.isLoading = false});

  @override
  @JsonKey()
  final String filePath;
  @override
  @JsonKey()
  final String extension;
  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'AudioConvertBlocStateModel(filePath: $filePath, extension: $extension, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioConvertBlocStateModelImpl &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.extension, extension) ||
                other.extension == extension) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType, filePath, extension, isLoading);

  /// Create a copy of AudioConvertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioConvertBlocStateModelImplCopyWith<_$AudioConvertBlocStateModelImpl>
      get copyWith => __$$AudioConvertBlocStateModelImplCopyWithImpl<
          _$AudioConvertBlocStateModelImpl>(this, _$identity);
}

abstract class _AudioConvertBlocStateModel
    implements AudioConvertBlocStateModel {
  const factory _AudioConvertBlocStateModel(
      {final String filePath,
      final String extension,
      final bool isLoading}) = _$AudioConvertBlocStateModelImpl;

  @override
  String get filePath;
  @override
  String get extension;
  @override
  bool get isLoading;

  /// Create a copy of AudioConvertBlocStateModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AudioConvertBlocStateModelImplCopyWith<_$AudioConvertBlocStateModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
