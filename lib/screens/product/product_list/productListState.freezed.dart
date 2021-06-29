// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'productListState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ProductListStateTearOff {
  const _$ProductListStateTearOff();

  _Default call(
      {bool isLoading = false,
      String? categoryTitle,
      ProductModel? productData,
      List<ProductResponse>? products,
      int? productTotal}) {
    return _Default(
      isLoading: isLoading,
      categoryTitle: categoryTitle,
      productData: productData,
      products: products,
      productTotal: productTotal,
    );
  }
}

/// @nodoc
const $ProductListState = _$ProductListStateTearOff();

/// @nodoc
mixin _$ProductListState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get categoryTitle => throw _privateConstructorUsedError;
  ProductModel? get productData => throw _privateConstructorUsedError;
  List<ProductResponse>? get products => throw _privateConstructorUsedError;
  int? get productTotal => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ProductListStateCopyWith<ProductListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductListStateCopyWith<$Res> {
  factory $ProductListStateCopyWith(
          ProductListState value, $Res Function(ProductListState) then) =
      _$ProductListStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      String? categoryTitle,
      ProductModel? productData,
      List<ProductResponse>? products,
      int? productTotal});

  $ProductModelCopyWith<$Res>? get productData;
}

/// @nodoc
class _$ProductListStateCopyWithImpl<$Res>
    implements $ProductListStateCopyWith<$Res> {
  _$ProductListStateCopyWithImpl(this._value, this._then);

  final ProductListState _value;
  // ignore: unused_field
  final $Res Function(ProductListState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categoryTitle = freezed,
    Object? productData = freezed,
    Object? products = freezed,
    Object? productTotal = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryTitle: categoryTitle == freezed
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      productData: productData == freezed
          ? _value.productData
          : productData // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductResponse>?,
      productTotal: productTotal == freezed
          ? _value.productTotal
          : productTotal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }

  @override
  $ProductModelCopyWith<$Res>? get productData {
    if (_value.productData == null) {
      return null;
    }

    return $ProductModelCopyWith<$Res>(_value.productData!, (value) {
      return _then(_value.copyWith(productData: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $ProductListStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      String? categoryTitle,
      ProductModel? productData,
      List<ProductResponse>? products,
      int? productTotal});

  @override
  $ProductModelCopyWith<$Res>? get productData;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$ProductListStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? categoryTitle = freezed,
    Object? productData = freezed,
    Object? products = freezed,
    Object? productTotal = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      categoryTitle: categoryTitle == freezed
          ? _value.categoryTitle
          : categoryTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      productData: productData == freezed
          ? _value.productData
          : productData // ignore: cast_nullable_to_non_nullable
              as ProductModel?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductResponse>?,
      productTotal: productTotal == freezed
          ? _value.productTotal
          : productTotal // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.categoryTitle,
      this.productData,
      this.products,
      this.productTotal});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String? categoryTitle;
  @override
  final ProductModel? productData;
  @override
  final List<ProductResponse>? products;
  @override
  final int? productTotal;

  @override
  String toString() {
    return 'ProductListState(isLoading: $isLoading, categoryTitle: $categoryTitle, productData: $productData, products: $products, productTotal: $productTotal)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.categoryTitle, categoryTitle) ||
                const DeepCollectionEquality()
                    .equals(other.categoryTitle, categoryTitle)) &&
            (identical(other.productData, productData) ||
                const DeepCollectionEquality()
                    .equals(other.productData, productData)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.productTotal, productTotal) ||
                const DeepCollectionEquality()
                    .equals(other.productTotal, productTotal)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(productData) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(productTotal);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements ProductListState {
  const factory _Default(
      {bool isLoading,
      String? categoryTitle,
      ProductModel? productData,
      List<ProductResponse>? products,
      int? productTotal}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String? get categoryTitle => throw _privateConstructorUsedError;
  @override
  ProductModel? get productData => throw _privateConstructorUsedError;
  @override
  List<ProductResponse>? get products => throw _privateConstructorUsedError;
  @override
  int? get productTotal => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
