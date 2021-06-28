// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'banner_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BannerResponse _$BannerResponseFromJson(Map<String, dynamic> json) {
  return _BannerResponse.fromJson(json);
}

/// @nodoc
class _$BannerResponseTearOff {
  const _$BannerResponseTearOff();

  _BannerResponse call(
      {@JsonKey(name: '_id') String? id, ImageResponse? image, String? title}) {
    return _BannerResponse(
      id: id,
      image: image,
      title: title,
    );
  }

  BannerResponse fromJson(Map<String, Object> json) {
    return BannerResponse.fromJson(json);
  }
}

/// @nodoc
const $BannerResponse = _$BannerResponseTearOff();

/// @nodoc
mixin _$BannerResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  ImageResponse? get image => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BannerResponseCopyWith<BannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BannerResponseCopyWith<$Res> {
  factory $BannerResponseCopyWith(
          BannerResponse value, $Res Function(BannerResponse) then) =
      _$BannerResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id, ImageResponse? image, String? title});

  $ImageResponseCopyWith<$Res>? get image;
}

/// @nodoc
class _$BannerResponseCopyWithImpl<$Res>
    implements $BannerResponseCopyWith<$Res> {
  _$BannerResponseCopyWithImpl(this._value, this._then);

  final BannerResponse _value;
  // ignore: unused_field
  final $Res Function(BannerResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $ImageResponseCopyWith<$Res>? get image {
    if (_value.image == null) {
      return null;
    }

    return $ImageResponseCopyWith<$Res>(_value.image!, (value) {
      return _then(_value.copyWith(image: value));
    });
  }
}

/// @nodoc
abstract class _$BannerResponseCopyWith<$Res>
    implements $BannerResponseCopyWith<$Res> {
  factory _$BannerResponseCopyWith(
          _BannerResponse value, $Res Function(_BannerResponse) then) =
      __$BannerResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id, ImageResponse? image, String? title});

  @override
  $ImageResponseCopyWith<$Res>? get image;
}

/// @nodoc
class __$BannerResponseCopyWithImpl<$Res>
    extends _$BannerResponseCopyWithImpl<$Res>
    implements _$BannerResponseCopyWith<$Res> {
  __$BannerResponseCopyWithImpl(
      _BannerResponse _value, $Res Function(_BannerResponse) _then)
      : super(_value, (v) => _then(v as _BannerResponse));

  @override
  _BannerResponse get _value => super._value as _BannerResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? image = freezed,
    Object? title = freezed,
  }) {
    return _then(_BannerResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      image: image == freezed
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BannerResponse extends _BannerResponse {
  const _$_BannerResponse(
      {@JsonKey(name: '_id') this.id, this.image, this.title})
      : super._();

  factory _$_BannerResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_BannerResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ImageResponse? image;
  @override
  final String? title;

  @override
  String toString() {
    return 'BannerResponse(id: $id, image: $image, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BannerResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.image, image) ||
                const DeepCollectionEquality().equals(other.image, image)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(image) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$BannerResponseCopyWith<_BannerResponse> get copyWith =>
      __$BannerResponseCopyWithImpl<_BannerResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BannerResponseToJson(this);
  }
}

abstract class _BannerResponse extends BannerResponse {
  const factory _BannerResponse(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? image,
      String? title}) = _$_BannerResponse;
  const _BannerResponse._() : super._();

  factory _BannerResponse.fromJson(Map<String, dynamic> json) =
      _$_BannerResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  ImageResponse? get image => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BannerResponseCopyWith<_BannerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
