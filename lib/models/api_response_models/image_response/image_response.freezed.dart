// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) {
  return _ImageResponse.fromJson(json);
}

/// @nodoc
class _$ImageResponseTearOff {
  const _$ImageResponseTearOff();

  _ImageResponse call({String? imageUrl, String? imageId, String? filePath}) {
    return _ImageResponse(
      imageUrl: imageUrl,
      imageId: imageId,
      filePath: filePath,
    );
  }

  ImageResponse fromJson(Map<String, Object> json) {
    return ImageResponse.fromJson(json);
  }
}

/// @nodoc
const $ImageResponse = _$ImageResponseTearOff();

/// @nodoc
mixin _$ImageResponse {
  String? get imageUrl => throw _privateConstructorUsedError;
  String? get imageId => throw _privateConstructorUsedError;
  String? get filePath => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageResponseCopyWith<ImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResponseCopyWith<$Res> {
  factory $ImageResponseCopyWith(
          ImageResponse value, $Res Function(ImageResponse) then) =
      _$ImageResponseCopyWithImpl<$Res>;
  $Res call({String? imageUrl, String? imageId, String? filePath});
}

/// @nodoc
class _$ImageResponseCopyWithImpl<$Res>
    implements $ImageResponseCopyWith<$Res> {
  _$ImageResponseCopyWithImpl(this._value, this._then);

  final ImageResponse _value;
  // ignore: unused_field
  final $Res Function(ImageResponse) _then;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_value.copyWith(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$ImageResponseCopyWith<$Res>
    implements $ImageResponseCopyWith<$Res> {
  factory _$ImageResponseCopyWith(
          _ImageResponse value, $Res Function(_ImageResponse) then) =
      __$ImageResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? imageUrl, String? imageId, String? filePath});
}

/// @nodoc
class __$ImageResponseCopyWithImpl<$Res>
    extends _$ImageResponseCopyWithImpl<$Res>
    implements _$ImageResponseCopyWith<$Res> {
  __$ImageResponseCopyWithImpl(
      _ImageResponse _value, $Res Function(_ImageResponse) _then)
      : super(_value, (v) => _then(v as _ImageResponse));

  @override
  _ImageResponse get _value => super._value as _ImageResponse;

  @override
  $Res call({
    Object? imageUrl = freezed,
    Object? imageId = freezed,
    Object? filePath = freezed,
  }) {
    return _then(_ImageResponse(
      imageUrl: imageUrl == freezed
          ? _value.imageUrl
          : imageUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageId: imageId == freezed
          ? _value.imageId
          : imageId // ignore: cast_nullable_to_non_nullable
              as String?,
      filePath: filePath == freezed
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ImageResponse extends _ImageResponse {
  const _$_ImageResponse({this.imageUrl, this.imageId, this.filePath})
      : super._();

  factory _$_ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ImageResponseFromJson(json);

  @override
  final String? imageUrl;
  @override
  final String? imageId;
  @override
  final String? filePath;

  @override
  String toString() {
    return 'ImageResponse(imageUrl: $imageUrl, imageId: $imageId, filePath: $filePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ImageResponse &&
            (identical(other.imageUrl, imageUrl) ||
                const DeepCollectionEquality()
                    .equals(other.imageUrl, imageUrl)) &&
            (identical(other.imageId, imageId) ||
                const DeepCollectionEquality()
                    .equals(other.imageId, imageId)) &&
            (identical(other.filePath, filePath) ||
                const DeepCollectionEquality()
                    .equals(other.filePath, filePath)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(imageUrl) ^
      const DeepCollectionEquality().hash(imageId) ^
      const DeepCollectionEquality().hash(filePath);

  @JsonKey(ignore: true)
  @override
  _$ImageResponseCopyWith<_ImageResponse> get copyWith =>
      __$ImageResponseCopyWithImpl<_ImageResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ImageResponseToJson(this);
  }
}

abstract class _ImageResponse extends ImageResponse {
  const factory _ImageResponse(
      {String? imageUrl, String? imageId, String? filePath}) = _$_ImageResponse;
  const _ImageResponse._() : super._();

  factory _ImageResponse.fromJson(Map<String, dynamic> json) =
      _$_ImageResponse.fromJson;

  @override
  String? get imageUrl => throw _privateConstructorUsedError;
  @override
  String? get imageId => throw _privateConstructorUsedError;
  @override
  String? get filePath => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ImageResponseCopyWith<_ImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
