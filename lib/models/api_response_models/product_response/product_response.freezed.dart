// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) {
  return _ProductResponse.fromJson(json);
}

/// @nodoc
class _$ProductResponseTearOff {
  const _$ProductResponseTearOff();

  _ProductResponse call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      VariantResponse? variant}) {
    return _ProductResponse(
      id: id,
      productImage: productImage,
      allergens: allergens,
      tags: tags,
      productName: productName,
      productDescription: productDescription,
      variant: variant,
    );
  }

  ProductResponse fromJson(Map<String, Object> json) {
    return ProductResponse.fromJson(json);
  }
}

/// @nodoc
const $ProductResponse = _$ProductResponseTearOff();

/// @nodoc
mixin _$ProductResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  List<String>? get allergens => throw _privateConstructorUsedError;
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  String? get productName => throw _privateConstructorUsedError;
  String? get productDescription =>
      throw _privateConstructorUsedError; // "productDescription": "<p>Gobi Manchurian</p>",
  VariantResponse? get variant => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductResponseCopyWith<ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductResponseCopyWith<$Res> {
  factory $ProductResponseCopyWith(
          ProductResponse value, $Res Function(ProductResponse) then) =
      _$ProductResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      VariantResponse? variant});

  $ImageResponseCopyWith<$Res>? get productImage;
  $VariantResponseCopyWith<$Res>? get variant;
}

/// @nodoc
class _$ProductResponseCopyWithImpl<$Res>
    implements $ProductResponseCopyWith<$Res> {
  _$ProductResponseCopyWithImpl(this._value, this._then);

  final ProductResponse _value;
  // ignore: unused_field
  final $Res Function(ProductResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? allergens = freezed,
    Object? tags = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? variant = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
    ));
  }

  @override
  $ImageResponseCopyWith<$Res>? get productImage {
    if (_value.productImage == null) {
      return null;
    }

    return $ImageResponseCopyWith<$Res>(_value.productImage!, (value) {
      return _then(_value.copyWith(productImage: value));
    });
  }

  @override
  $VariantResponseCopyWith<$Res>? get variant {
    if (_value.variant == null) {
      return null;
    }

    return $VariantResponseCopyWith<$Res>(_value.variant!, (value) {
      return _then(_value.copyWith(variant: value));
    });
  }
}

/// @nodoc
abstract class _$ProductResponseCopyWith<$Res>
    implements $ProductResponseCopyWith<$Res> {
  factory _$ProductResponseCopyWith(
          _ProductResponse value, $Res Function(_ProductResponse) then) =
      __$ProductResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      VariantResponse? variant});

  @override
  $ImageResponseCopyWith<$Res>? get productImage;
  @override
  $VariantResponseCopyWith<$Res>? get variant;
}

/// @nodoc
class __$ProductResponseCopyWithImpl<$Res>
    extends _$ProductResponseCopyWithImpl<$Res>
    implements _$ProductResponseCopyWith<$Res> {
  __$ProductResponseCopyWithImpl(
      _ProductResponse _value, $Res Function(_ProductResponse) _then)
      : super(_value, (v) => _then(v as _ProductResponse));

  @override
  _ProductResponse get _value => super._value as _ProductResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? productImage = freezed,
    Object? allergens = freezed,
    Object? tags = freezed,
    Object? productName = freezed,
    Object? productDescription = freezed,
    Object? variant = freezed,
  }) {
    return _then(_ProductResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      productImage: productImage == freezed
          ? _value.productImage
          : productImage // ignore: cast_nullable_to_non_nullable
              as ImageResponse?,
      allergens: allergens == freezed
          ? _value.allergens
          : allergens // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      tags: tags == freezed
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<TagResponse>?,
      productName: productName == freezed
          ? _value.productName
          : productName // ignore: cast_nullable_to_non_nullable
              as String?,
      productDescription: productDescription == freezed
          ? _value.productDescription
          : productDescription // ignore: cast_nullable_to_non_nullable
              as String?,
      variant: variant == freezed
          ? _value.variant
          : variant // ignore: cast_nullable_to_non_nullable
              as VariantResponse?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductResponse extends _ProductResponse {
  const _$_ProductResponse(
      {@JsonKey(name: '_id') this.id,
      this.productImage,
      this.allergens,
      this.tags,
      this.productName,
      this.productDescription,
      this.variant})
      : super._();

  factory _$_ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final ImageResponse? productImage;
  @override
  final List<String>? allergens;
  @override
  final List<TagResponse>? tags;
  @override
  final String? productName;
  @override
  final String? productDescription;
  @override // "productDescription": "<p>Gobi Manchurian</p>",
  final VariantResponse? variant;

  @override
  String toString() {
    return 'ProductResponse(id: $id, productImage: $productImage, allergens: $allergens, tags: $tags, productName: $productName, productDescription: $productDescription, variant: $variant)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.productImage, productImage) ||
                const DeepCollectionEquality()
                    .equals(other.productImage, productImage)) &&
            (identical(other.allergens, allergens) ||
                const DeepCollectionEquality()
                    .equals(other.allergens, allergens)) &&
            (identical(other.tags, tags) ||
                const DeepCollectionEquality().equals(other.tags, tags)) &&
            (identical(other.productName, productName) ||
                const DeepCollectionEquality()
                    .equals(other.productName, productName)) &&
            (identical(other.productDescription, productDescription) ||
                const DeepCollectionEquality()
                    .equals(other.productDescription, productDescription)) &&
            (identical(other.variant, variant) ||
                const DeepCollectionEquality().equals(other.variant, variant)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(productImage) ^
      const DeepCollectionEquality().hash(allergens) ^
      const DeepCollectionEquality().hash(tags) ^
      const DeepCollectionEquality().hash(productName) ^
      const DeepCollectionEquality().hash(productDescription) ^
      const DeepCollectionEquality().hash(variant);

  @JsonKey(ignore: true)
  @override
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      __$ProductResponseCopyWithImpl<_ProductResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductResponseToJson(this);
  }
}

abstract class _ProductResponse extends ProductResponse {
  const factory _ProductResponse(
      {@JsonKey(name: '_id') String? id,
      ImageResponse? productImage,
      List<String>? allergens,
      List<TagResponse>? tags,
      String? productName,
      String? productDescription,
      VariantResponse? variant}) = _$_ProductResponse;
  const _ProductResponse._() : super._();

  factory _ProductResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  ImageResponse? get productImage => throw _privateConstructorUsedError;
  @override
  List<String>? get allergens => throw _privateConstructorUsedError;
  @override
  List<TagResponse>? get tags => throw _privateConstructorUsedError;
  @override
  String? get productName => throw _privateConstructorUsedError;
  @override
  String? get productDescription => throw _privateConstructorUsedError;
  @override // "productDescription": "<p>Gobi Manchurian</p>",
  VariantResponse? get variant => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductResponseCopyWith<_ProductResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
