// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'update_product.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UpdateProduct _$UpdateProductFromJson(Map<String, dynamic> json) {
  return _UpdateProduct.fromJson(json);
}

/// @nodoc
class _$UpdateProductTearOff {
  const _$UpdateProductTearOff();

  _UpdateProduct call(
      {String? productId,
      String? sizeName,
      int? quantity,
      List<AddOnItem> addOnItems = const []}) {
    return _UpdateProduct(
      productId: productId,
      sizeName: sizeName,
      quantity: quantity,
      addOnItems: addOnItems,
    );
  }

  UpdateProduct fromJson(Map<String, Object> json) {
    return UpdateProduct.fromJson(json);
  }
}

/// @nodoc
const $UpdateProduct = _$UpdateProductTearOff();

/// @nodoc
mixin _$UpdateProduct {
  String? get productId => throw _privateConstructorUsedError;
  String? get sizeName => throw _privateConstructorUsedError;
  int? get quantity => throw _privateConstructorUsedError;
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UpdateProductCopyWith<UpdateProduct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UpdateProductCopyWith<$Res> {
  factory $UpdateProductCopyWith(
          UpdateProduct value, $Res Function(UpdateProduct) then) =
      _$UpdateProductCopyWithImpl<$Res>;
  $Res call(
      {String? productId,
      String? sizeName,
      int? quantity,
      List<AddOnItem> addOnItems});
}

/// @nodoc
class _$UpdateProductCopyWithImpl<$Res>
    implements $UpdateProductCopyWith<$Res> {
  _$UpdateProductCopyWithImpl(this._value, this._then);

  final UpdateProduct _value;
  // ignore: unused_field
  final $Res Function(UpdateProduct) _then;

  @override
  $Res call({
    Object? productId = freezed,
    Object? sizeName = freezed,
    Object? quantity = freezed,
    Object? addOnItems = freezed,
  }) {
    return _then(_value.copyWith(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
    ));
  }
}

/// @nodoc
abstract class _$UpdateProductCopyWith<$Res>
    implements $UpdateProductCopyWith<$Res> {
  factory _$UpdateProductCopyWith(
          _UpdateProduct value, $Res Function(_UpdateProduct) then) =
      __$UpdateProductCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? productId,
      String? sizeName,
      int? quantity,
      List<AddOnItem> addOnItems});
}

/// @nodoc
class __$UpdateProductCopyWithImpl<$Res>
    extends _$UpdateProductCopyWithImpl<$Res>
    implements _$UpdateProductCopyWith<$Res> {
  __$UpdateProductCopyWithImpl(
      _UpdateProduct _value, $Res Function(_UpdateProduct) _then)
      : super(_value, (v) => _then(v as _UpdateProduct));

  @override
  _UpdateProduct get _value => super._value as _UpdateProduct;

  @override
  $Res call({
    Object? productId = freezed,
    Object? sizeName = freezed,
    Object? quantity = freezed,
    Object? addOnItems = freezed,
  }) {
    return _then(_UpdateProduct(
      productId: productId == freezed
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as String?,
      sizeName: sizeName == freezed
          ? _value.sizeName
          : sizeName // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: quantity == freezed
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as int?,
      addOnItems: addOnItems == freezed
          ? _value.addOnItems
          : addOnItems // ignore: cast_nullable_to_non_nullable
              as List<AddOnItem>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UpdateProduct extends _UpdateProduct {
  const _$_UpdateProduct(
      {this.productId,
      this.sizeName,
      this.quantity,
      this.addOnItems = const []})
      : super._();

  factory _$_UpdateProduct.fromJson(Map<String, dynamic> json) =>
      _$_$_UpdateProductFromJson(json);

  @override
  final String? productId;
  @override
  final String? sizeName;
  @override
  final int? quantity;
  @JsonKey(defaultValue: const [])
  @override
  final List<AddOnItem> addOnItems;

  @override
  String toString() {
    return 'UpdateProduct(productId: $productId, sizeName: $sizeName, quantity: $quantity, addOnItems: $addOnItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UpdateProduct &&
            (identical(other.productId, productId) ||
                const DeepCollectionEquality()
                    .equals(other.productId, productId)) &&
            (identical(other.sizeName, sizeName) ||
                const DeepCollectionEquality()
                    .equals(other.sizeName, sizeName)) &&
            (identical(other.quantity, quantity) ||
                const DeepCollectionEquality()
                    .equals(other.quantity, quantity)) &&
            (identical(other.addOnItems, addOnItems) ||
                const DeepCollectionEquality()
                    .equals(other.addOnItems, addOnItems)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(productId) ^
      const DeepCollectionEquality().hash(sizeName) ^
      const DeepCollectionEquality().hash(quantity) ^
      const DeepCollectionEquality().hash(addOnItems);

  @JsonKey(ignore: true)
  @override
  _$UpdateProductCopyWith<_UpdateProduct> get copyWith =>
      __$UpdateProductCopyWithImpl<_UpdateProduct>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UpdateProductToJson(this);
  }
}

abstract class _UpdateProduct extends UpdateProduct {
  const factory _UpdateProduct(
      {String? productId,
      String? sizeName,
      int? quantity,
      List<AddOnItem> addOnItems}) = _$_UpdateProduct;
  const _UpdateProduct._() : super._();

  factory _UpdateProduct.fromJson(Map<String, dynamic> json) =
      _$_UpdateProduct.fromJson;

  @override
  String? get productId => throw _privateConstructorUsedError;
  @override
  String? get sizeName => throw _privateConstructorUsedError;
  @override
  int? get quantity => throw _privateConstructorUsedError;
  @override
  List<AddOnItem> get addOnItems => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UpdateProductCopyWith<_UpdateProduct> get copyWith =>
      throw _privateConstructorUsedError;
}
