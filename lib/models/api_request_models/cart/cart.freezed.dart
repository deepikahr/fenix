// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cart.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Cart _$CartFromJson(Map<String, dynamic> json) {
  return _Cart.fromJson(json);
}

/// @nodoc
class _$CartTearOff {
  const _$CartTearOff();

  _Cart call(
      {@JsonKey(name: 'cart') List<ProductDetailsResponse> products = const [],
      dynamic grandTotal = 0,
      dynamic subTotal = 0,
      String? deliveryType,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId}) {
    return _Cart(
      products: products,
      grandTotal: grandTotal,
      subTotal: subTotal,
      deliveryType: deliveryType,
      paymentType: paymentType,
      restaurantName: restaurantName,
      franchiseName: franchiseName,
      franchiseId: franchiseId,
      vendorId: vendorId,
      userId: userId,
    );
  }

  Cart fromJson(Map<String, Object> json) {
    return Cart.fromJson(json);
  }
}

/// @nodoc
const $Cart = _$CartTearOff();

/// @nodoc
mixin _$Cart {
  @JsonKey(name: 'cart')
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  dynamic get grandTotal => throw _privateConstructorUsedError;
  dynamic get subTotal => throw _privateConstructorUsedError;
  String? get deliveryType => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      dynamic grandTotal,
      dynamic subTotal,
      String? deliveryType,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? products = freezed,
    Object? grandTotal = freezed,
    Object? subTotal = freezed,
    Object? deliveryType = freezed,
    Object? paymentType = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_value.copyWith(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as dynamic,
      deliveryType: deliveryType == freezed
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) then) =
      __$CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      dynamic grandTotal,
      dynamic subTotal,
      String? deliveryType,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId});
}

/// @nodoc
class __$CartCopyWithImpl<$Res> extends _$CartCopyWithImpl<$Res>
    implements _$CartCopyWith<$Res> {
  __$CartCopyWithImpl(_Cart _value, $Res Function(_Cart) _then)
      : super(_value, (v) => _then(v as _Cart));

  @override
  _Cart get _value => super._value as _Cart;

  @override
  $Res call({
    Object? products = freezed,
    Object? grandTotal = freezed,
    Object? subTotal = freezed,
    Object? deliveryType = freezed,
    Object? paymentType = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? userId = freezed,
  }) {
    return _then(_Cart(
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      grandTotal: grandTotal == freezed ? _value.grandTotal : grandTotal,
      subTotal: subTotal == freezed ? _value.subTotal : subTotal,
      deliveryType: deliveryType == freezed
          ? _value.deliveryType
          : deliveryType // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String?,
      restaurantName: restaurantName == freezed
          ? _value.restaurantName
          : restaurantName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseName: franchiseName == freezed
          ? _value.franchiseName
          : franchiseName // ignore: cast_nullable_to_non_nullable
              as String?,
      franchiseId: franchiseId == freezed
          ? _value.franchiseId
          : franchiseId // ignore: cast_nullable_to_non_nullable
              as String?,
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: userId == freezed
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cart extends _Cart {
  _$_Cart(
      {@JsonKey(name: 'cart') this.products = const [],
      this.grandTotal = 0,
      this.subTotal = 0,
      this.deliveryType,
      this.paymentType,
      this.restaurantName,
      this.franchiseName,
      this.franchiseId,
      this.vendorId,
      this.userId})
      : super._();

  factory _$_Cart.fromJson(Map<String, dynamic> json) =>
      _$_$_CartFromJson(json);

  @override
  @JsonKey(name: 'cart')
  final List<ProductDetailsResponse> products;
  @JsonKey(defaultValue: 0)
  @override
  final dynamic grandTotal;
  @JsonKey(defaultValue: 0)
  @override
  final dynamic subTotal;
  @override
  final String? deliveryType;
  @override
  final String? paymentType;
  @override
  final String? restaurantName;
  @override
  final String? franchiseName;
  @override
  final String? franchiseId;
  @override
  final String? vendorId;
  @override
  final String? userId;

  @override
  String toString() {
    return 'Cart(products: $products, grandTotal: $grandTotal, subTotal: $subTotal, deliveryType: $deliveryType, paymentType: $paymentType, restaurantName: $restaurantName, franchiseName: $franchiseName, franchiseId: $franchiseId, vendorId: $vendorId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cart &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.grandTotal, grandTotal) ||
                const DeepCollectionEquality()
                    .equals(other.grandTotal, grandTotal)) &&
            (identical(other.subTotal, subTotal) ||
                const DeepCollectionEquality()
                    .equals(other.subTotal, subTotal)) &&
            (identical(other.deliveryType, deliveryType) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryType, deliveryType)) &&
            (identical(other.paymentType, paymentType) ||
                const DeepCollectionEquality()
                    .equals(other.paymentType, paymentType)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.userId, userId) ||
                const DeepCollectionEquality().equals(other.userId, userId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(grandTotal) ^
      const DeepCollectionEquality().hash(subTotal) ^
      const DeepCollectionEquality().hash(deliveryType) ^
      const DeepCollectionEquality().hash(paymentType) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(userId);

  @JsonKey(ignore: true)
  @override
  _$CartCopyWith<_Cart> get copyWith =>
      __$CartCopyWithImpl<_Cart>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_CartToJson(this);
  }
}

abstract class _Cart extends Cart {
  factory _Cart(
      {@JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      dynamic grandTotal,
      dynamic subTotal,
      String? deliveryType,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId}) = _$_Cart;
  _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  @JsonKey(name: 'cart')
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  @override
  dynamic get grandTotal => throw _privateConstructorUsedError;
  @override
  dynamic get subTotal => throw _privateConstructorUsedError;
  @override
  String? get deliveryType => throw _privateConstructorUsedError;
  @override
  String? get paymentType => throw _privateConstructorUsedError;
  @override
  String? get restaurantName => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get userId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartCopyWith<_Cart> get copyWith => throw _privateConstructorUsedError;
}
