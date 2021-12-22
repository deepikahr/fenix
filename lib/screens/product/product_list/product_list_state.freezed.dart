// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'product_list_state.dart';

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
      List<ProductDetailsResponse> products = const [],
      int totalProducts = 0,
      int pageNumber = 1,
      dynamic productAdded = false}) {
    return _Default(
      isLoading: isLoading,
      categoryTitle: categoryTitle,
      products: products,
      totalProducts: totalProducts,
      pageNumber: pageNumber,
      productAdded: productAdded,
    );
  }
}

/// @nodoc
const $ProductListState = _$ProductListStateTearOff();

/// @nodoc
mixin _$ProductListState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get categoryTitle => throw _privateConstructorUsedError;
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  int get totalProducts => throw _privateConstructorUsedError;
  int get pageNumber => throw _privateConstructorUsedError;
  dynamic get productAdded => throw _privateConstructorUsedError;

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
      List<ProductDetailsResponse> products,
      int totalProducts,
      int pageNumber,
      dynamic productAdded});
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
    Object? products = freezed,
    Object? totalProducts = freezed,
    Object? pageNumber = freezed,
    Object? productAdded = freezed,
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
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      totalProducts: totalProducts == freezed
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productAdded: productAdded == freezed
          ? _value.productAdded
          : productAdded // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
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
      List<ProductDetailsResponse> products,
      int totalProducts,
      int pageNumber,
      dynamic productAdded});
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
    Object? products = freezed,
    Object? totalProducts = freezed,
    Object? pageNumber = freezed,
    Object? productAdded = freezed,
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
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      totalProducts: totalProducts == freezed
          ? _value.totalProducts
          : totalProducts // ignore: cast_nullable_to_non_nullable
              as int,
      pageNumber: pageNumber == freezed
          ? _value.pageNumber
          : pageNumber // ignore: cast_nullable_to_non_nullable
              as int,
      productAdded:
          productAdded == freezed ? _value.productAdded : productAdded,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.categoryTitle,
      this.products = const [],
      this.totalProducts = 0,
      this.pageNumber = 1,
      this.productAdded = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String? categoryTitle;
  @JsonKey(defaultValue: const [])
  @override
  final List<ProductDetailsResponse> products;
  @JsonKey(defaultValue: 0)
  @override
  final int totalProducts;
  @JsonKey(defaultValue: 1)
  @override
  final int pageNumber;
  @JsonKey(defaultValue: false)
  @override
  final dynamic productAdded;

  @override
  String toString() {
    return 'ProductListState(isLoading: $isLoading, categoryTitle: $categoryTitle, products: $products, totalProducts: $totalProducts, pageNumber: $pageNumber, productAdded: $productAdded)';
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
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.totalProducts, totalProducts) ||
                const DeepCollectionEquality()
                    .equals(other.totalProducts, totalProducts)) &&
            (identical(other.pageNumber, pageNumber) ||
                const DeepCollectionEquality()
                    .equals(other.pageNumber, pageNumber)) &&
            (identical(other.productAdded, productAdded) ||
                const DeepCollectionEquality()
                    .equals(other.productAdded, productAdded)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(categoryTitle) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(totalProducts) ^
      const DeepCollectionEquality().hash(pageNumber) ^
      const DeepCollectionEquality().hash(productAdded);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements ProductListState {
  const factory _Default(
      {bool isLoading,
      String? categoryTitle,
      List<ProductDetailsResponse> products,
      int totalProducts,
      int pageNumber,
      dynamic productAdded}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String? get categoryTitle => throw _privateConstructorUsedError;
  @override
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  @override
  int get totalProducts => throw _privateConstructorUsedError;
  @override
  int get pageNumber => throw _privateConstructorUsedError;
  @override
  dynamic get productAdded => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
