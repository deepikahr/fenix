// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sub_category_product_data_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SubCategoryProductDataResponse _$SubCategoryProductDataResponseFromJson(
    Map<String, dynamic> json) {
  return _SubCategoryProductDataResponse.fromJson(json);
}

/// @nodoc
class _$SubCategoryProductDataResponseTearOff {
  const _$SubCategoryProductDataResponseTearOff();

  _SubCategoryProductDataResponse call(
      {String? subCategoryTitle, ProductModel? product}) {
    return _SubCategoryProductDataResponse(
      subCategoryTitle: subCategoryTitle,
      product: product,
    );
  }

  SubCategoryProductDataResponse fromJson(Map<String, Object> json) {
    return SubCategoryProductDataResponse.fromJson(json);
  }
}

/// @nodoc
const $SubCategoryProductDataResponse =
    _$SubCategoryProductDataResponseTearOff();

/// @nodoc
mixin _$SubCategoryProductDataResponse {
  String? get subCategoryTitle => throw _privateConstructorUsedError;
  ProductModel? get product => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubCategoryProductDataResponseCopyWith<SubCategoryProductDataResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubCategoryProductDataResponseCopyWith<$Res> {
  factory $SubCategoryProductDataResponseCopyWith(
          SubCategoryProductDataResponse value,
          $Res Function(SubCategoryProductDataResponse) then) =
      _$SubCategoryProductDataResponseCopyWithImpl<$Res>;
  $Res call({String? subCategoryTitle, ProductModel? product});

  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class _$SubCategoryProductDataResponseCopyWithImpl<$Res>
    implements $SubCategoryProductDataResponseCopyWith<$Res> {
  _$SubCategoryProductDataResponseCopyWithImpl(this._value, this._then);

  final SubCategoryProductDataResponse _value;
  // ignore: unused_field
  final $Res Function(SubCategoryProductDataResponse) _then;

  @override
  $Res call({
    Object? subCategoryTitle = freezed,
    Object? product = freezed,
  }) {
    return _then(_value.copyWith(
      subCategoryTitle: subCategoryTitle == freezed
          ? _value.subCategoryTitle
          : subCategoryTitle // ignore: cast_nullable_to_non_nullable
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
abstract class _$SubCategoryProductDataResponseCopyWith<$Res>
    implements $SubCategoryProductDataResponseCopyWith<$Res> {
  factory _$SubCategoryProductDataResponseCopyWith(
          _SubCategoryProductDataResponse value,
          $Res Function(_SubCategoryProductDataResponse) then) =
      __$SubCategoryProductDataResponseCopyWithImpl<$Res>;
  @override
  $Res call({String? subCategoryTitle, ProductModel? product});

  @override
  $ProductModelCopyWith<$Res>? get product;
}

/// @nodoc
class __$SubCategoryProductDataResponseCopyWithImpl<$Res>
    extends _$SubCategoryProductDataResponseCopyWithImpl<$Res>
    implements _$SubCategoryProductDataResponseCopyWith<$Res> {
  __$SubCategoryProductDataResponseCopyWithImpl(
      _SubCategoryProductDataResponse _value,
      $Res Function(_SubCategoryProductDataResponse) _then)
      : super(_value, (v) => _then(v as _SubCategoryProductDataResponse));

  @override
  _SubCategoryProductDataResponse get _value =>
      super._value as _SubCategoryProductDataResponse;

  @override
  $Res call({
    Object? subCategoryTitle = freezed,
    Object? product = freezed,
  }) {
    return _then(_SubCategoryProductDataResponse(
      subCategoryTitle: subCategoryTitle == freezed
          ? _value.subCategoryTitle
          : subCategoryTitle // ignore: cast_nullable_to_non_nullable
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
class _$_SubCategoryProductDataResponse
    extends _SubCategoryProductDataResponse {
  const _$_SubCategoryProductDataResponse({this.subCategoryTitle, this.product})
      : super._();

  factory _$_SubCategoryProductDataResponse.fromJson(
          Map<String, dynamic> json) =>
      _$_$_SubCategoryProductDataResponseFromJson(json);

  @override
  final String? subCategoryTitle;
  @override
  final ProductModel? product;

  @override
  String toString() {
    return 'SubCategoryProductDataResponse(subCategoryTitle: $subCategoryTitle, product: $product)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SubCategoryProductDataResponse &&
            (identical(other.subCategoryTitle, subCategoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.subCategoryTitle, subCategoryTitle)) &&
            (identical(other.product, product) ||
                const DeepCollectionEquality().equals(other.product, product)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(subCategoryTitle) ^
      const DeepCollectionEquality().hash(product);

  @JsonKey(ignore: true)
  @override
  _$SubCategoryProductDataResponseCopyWith<_SubCategoryProductDataResponse>
      get copyWith => __$SubCategoryProductDataResponseCopyWithImpl<
          _SubCategoryProductDataResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SubCategoryProductDataResponseToJson(this);
  }
}

abstract class _SubCategoryProductDataResponse
    extends SubCategoryProductDataResponse {
  const factory _SubCategoryProductDataResponse(
      {String? subCategoryTitle,
      ProductModel? product}) = _$_SubCategoryProductDataResponse;
  const _SubCategoryProductDataResponse._() : super._();

  factory _SubCategoryProductDataResponse.fromJson(Map<String, dynamic> json) =
      _$_SubCategoryProductDataResponse.fromJson;

  @override
  String? get subCategoryTitle => throw _privateConstructorUsedError;
  @override
  ProductModel? get product => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SubCategoryProductDataResponseCopyWith<_SubCategoryProductDataResponse>
      get copyWith => throw _privateConstructorUsedError;
}
