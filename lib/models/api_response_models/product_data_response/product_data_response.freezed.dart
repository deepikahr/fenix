// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ProductDataResponse _$ProductDataResponseFromJson(Map<String, dynamic> json) {
  return _ProductDataResponse.fromJson(json);
}

/// @nodoc
class _$ProductDataResponseTearOff {
  const _$ProductDataResponseTearOff();

  _ProductDataResponse call({String? categoryTitle, ProductModel? product}) {
    return _ProductDataResponse(
      categoryTitle: categoryTitle,
      product: product,
    );
  }

  ProductDataResponse fromJson(Map<String, Object> json) {
    return ProductDataResponse.fromJson(json);
  }
}

/// @nodoc
const $ProductDataResponse = _$ProductDataResponseTearOff();

/// @nodoc
mixin _$ProductDataResponse {
  String? get categoryTitle => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductDataResponseCopyWith<ProductDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductDataResponseCopyWith<$Res> {
  factory $ProductDataResponseCopyWith(
          ProductDataResponse value, $Res Function(ProductDataResponse) then) =
      _$ProductDataResponseCopyWithImpl<$Res>;
  $Res call({String? categoryTitle, ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$ProductDataResponseCopyWithImpl<$Res>
    implements $ProductDataResponseCopyWith<$Res> {
  _$ProductDataResponseCopyWithImpl(this._value, this._then);

  final ProductDataResponse _value;
  // ignore: unused_field
  final $Res Function(ProductDataResponse) _then;

  @override
  $Res call({
    Object? categoryTitle = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      categoryTitle: categoryTitle == freezed
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }

  @override
  $ProductModelCopyWith<$Res>? get product {
    if (_value.product == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.product!, (value) {
      return _then(_value.copyWith(product: value));
    });
  }
}

/// @nodoc
abstract class _$ProductDataResponseCopyWith<$Res>
    implements $ProductDataResponseCopyWith<$Res> {
  factory _$ProductDataResponseCopyWith(_ProductDataResponse value,
          $Res Function(_ProductDataResponse) then) =
      __$ProductDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? categoryTitle, ProductModel? product});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$ProductDataResponseCopyWithImpl<$Res>
    extends _$ProductDataResponseCopyWithImpl<$Res>
    implements _$ProductDataResponseCopyWith<$Res> {
  __$ProductDataResponseCopyWithImpl(
      _ProductDataResponse _value, $Res Function(_ProductDataResponse) _then)
      : super(_value, (v) => _then(v as _ProductDataResponse));

  @override
  _ProductDataResponse get _value => super._value as _ProductDataResponse;

  @override
  $Res call({
    Object? categoryTitle = freezed,
    Object? product = freezed,
  }) {
    return _then(_ProductDataResponse(
      categoryTitle: categoryTitle == freezed
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      product: product == freezed
          ? _value.product
          : product // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ProductDataResponse extends _ProductDataResponse {
  const _$_ProductDataResponse({this.categoryTitle, this.product}) : super._();

  factory _$_ProductDataResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_ProductDataResponseFromJson(json);

  @override
  final String? categoryTitle;
  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'ProductDataResponse(categoryTitle: $categoryTitle, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ProductDataResponse &&
            (identical(other.categoryTitle, categoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoryTitle, categoryTitle)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality().equals(other.product, product)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(product);

  @JsonKey(ignore: true)
  @override
  _$ProductDataResponseCopyWith<_ProductDataResponse> get copyWith =>
      __$ProductDataResponseCopyWithImpl<_ProductDataResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProductDataResponseToJson(this);
  }
}

abstract class _ProductDataResponse extends ProductDataResponse {
  const factory _ProductDataResponse(
      {String? categoryTitle, ProductModel? product}) = _$_ProductDataResponse;
  const _ProductDataResponse._() : super._();

  factory _ProductDataResponse.fromJson(Map<String, dynamic> json) =
      _$_ProductDataResponse.fromJson;

  @override
  String? get categoryTitle => throw _privateConstructorUsedError;
  @override
  ProductModel? get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProductDataResponseCopyWith<_ProductDataResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
