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
      {String? vendorId,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      int? preparationTime,
      @JsonKey(name: 'cart') List<ProductDetailsResponse> products = const [],
      String? couponCode,
      double couponAmount = 0,
      double tipAmount = 0,
      double subTotal = 0,
      double tax = 0,
      double deliveryCharges = 0,
      double grandTotal = 0,
      String orderFrom = 'USER_APP',
      String paymentType = 'COD',
      bool isWalletUsed = false,
      double usedWalletAmount = 0}) {
    return _Cart(
      vendorId: vendorId,
      restaurantName: restaurantName,
      franchiseName: franchiseName,
      franchiseId: franchiseId,
      preparationTime: preparationTime,
      products: products,
      couponCode: couponCode,
      couponAmount: couponAmount,
      tipAmount: tipAmount,
      subTotal: subTotal,
      tax: tax,
      deliveryCharges: deliveryCharges,
      grandTotal: grandTotal,
      orderFrom: orderFrom,
      paymentType: paymentType,
      isWalletUsed: isWalletUsed,
      usedWalletAmount: usedWalletAmount,
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
  String? get vendorId => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  int? get preparationTime => throw _privateConstructorUsedError;
  @JsonKey(name: 'cart')
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  String? get couponCode => throw _privateConstructorUsedError;
  double get couponAmount => throw _privateConstructorUsedError;
  double get tipAmount => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  double get tax => throw _privateConstructorUsedError;
  double get deliveryCharges => throw _privateConstructorUsedError;
  double get grandTotal =>
      throw _privateConstructorUsedError; // UserAddress? address,
  String get orderFrom => throw _privateConstructorUsedError;
  String get paymentType => throw _privateConstructorUsedError;
  bool get isWalletUsed => throw _privateConstructorUsedError;
  double get usedWalletAmount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CartCopyWith<Cart> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartCopyWith<$Res> {
  factory $CartCopyWith(Cart value, $Res Function(Cart) then) =
      _$CartCopyWithImpl<$Res>;
  $Res call(
      {String? vendorId,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      int? preparationTime,
      @JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      String? couponCode,
      double couponAmount,
      double tipAmount,
      double subTotal,
      double tax,
      double deliveryCharges,
      double grandTotal,
      String orderFrom,
      String paymentType,
      bool isWalletUsed,
      double usedWalletAmount});
}

/// @nodoc
class _$CartCopyWithImpl<$Res> implements $CartCopyWith<$Res> {
  _$CartCopyWithImpl(this._value, this._then);

  final Cart _value;
  // ignore: unused_field
  final $Res Function(Cart) _then;

  @override
  $Res call({
    Object? vendorId = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? preparationTime = freezed,
    Object? products = freezed,
    Object? couponCode = freezed,
    Object? couponAmount = freezed,
    Object? tipAmount = freezed,
    Object? subTotal = freezed,
    Object? tax = freezed,
    Object? deliveryCharges = freezed,
    Object? grandTotal = freezed,
    Object? orderFrom = freezed,
    Object? paymentType = freezed,
    Object? isWalletUsed = freezed,
    Object? usedWalletAmount = freezed,
  }) {
    return _then(_value.copyWith(
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
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
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      couponCode: couponCode == freezed
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      couponAmount: couponAmount == freezed
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: tipAmount == freezed
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryCharges: deliveryCharges == freezed
          ? _value.deliveryCharges
          : deliveryCharges // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      orderFrom: orderFrom == freezed
          ? _value.orderFrom
          : orderFrom // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      isWalletUsed: isWalletUsed == freezed
          ? _value.isWalletUsed
          : isWalletUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      usedWalletAmount: usedWalletAmount == freezed
          ? _value.usedWalletAmount
          : usedWalletAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$CartCopyWith<$Res> implements $CartCopyWith<$Res> {
  factory _$CartCopyWith(_Cart value, $Res Function(_Cart) then) =
      __$CartCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? vendorId,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      int? preparationTime,
      @JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      String? couponCode,
      double couponAmount,
      double tipAmount,
      double subTotal,
      double tax,
      double deliveryCharges,
      double grandTotal,
      String orderFrom,
      String paymentType,
      bool isWalletUsed,
      double usedWalletAmount});
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
    Object? vendorId = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? preparationTime = freezed,
    Object? products = freezed,
    Object? couponCode = freezed,
    Object? couponAmount = freezed,
    Object? tipAmount = freezed,
    Object? subTotal = freezed,
    Object? tax = freezed,
    Object? deliveryCharges = freezed,
    Object? grandTotal = freezed,
    Object? orderFrom = freezed,
    Object? paymentType = freezed,
    Object? isWalletUsed = freezed,
    Object? usedWalletAmount = freezed,
  }) {
    return _then(_Cart(
      vendorId: vendorId == freezed
          ? _value.vendorId
          : vendorId // ignore: cast_nullable_to_non_nullable
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
      preparationTime: preparationTime == freezed
          ? _value.preparationTime
          : preparationTime // ignore: cast_nullable_to_non_nullable
              as int?,
      products: products == freezed
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductDetailsResponse>,
      couponCode: couponCode == freezed
          ? _value.couponCode
          : couponCode // ignore: cast_nullable_to_non_nullable
              as String?,
      couponAmount: couponAmount == freezed
          ? _value.couponAmount
          : couponAmount // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: tipAmount == freezed
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tax: tax == freezed
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double,
      deliveryCharges: deliveryCharges == freezed
          ? _value.deliveryCharges
          : deliveryCharges // ignore: cast_nullable_to_non_nullable
              as double,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      orderFrom: orderFrom == freezed
          ? _value.orderFrom
          : orderFrom // ignore: cast_nullable_to_non_nullable
              as String,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as String,
      isWalletUsed: isWalletUsed == freezed
          ? _value.isWalletUsed
          : isWalletUsed // ignore: cast_nullable_to_non_nullable
              as bool,
      usedWalletAmount: usedWalletAmount == freezed
          ? _value.usedWalletAmount
          : usedWalletAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Cart extends _Cart {
  _$_Cart(
      {this.vendorId,
      this.restaurantName,
      this.franchiseName,
      this.franchiseId,
      this.preparationTime,
      @JsonKey(name: 'cart') this.products = const [],
      this.couponCode,
      this.couponAmount = 0,
      this.tipAmount = 0,
      this.subTotal = 0,
      this.tax = 0,
      this.deliveryCharges = 0,
      this.grandTotal = 0,
      this.orderFrom = 'USER_APP',
      this.paymentType = 'COD',
      this.isWalletUsed = false,
      this.usedWalletAmount = 0})
      : super._();

  factory _$_Cart.fromJson(Map<String, dynamic> json) =>
      _$_$_CartFromJson(json);

  @override
  final String? vendorId;
  @override
  final String? restaurantName;
  @override
  final String? franchiseName;
  @override
  final String? franchiseId;
  @override
  final int? preparationTime;
  @override
  @JsonKey(name: 'cart')
  final List<ProductDetailsResponse> products;
  @override
  final String? couponCode;
  @JsonKey(defaultValue: 0)
  @override
  final double couponAmount;
  @JsonKey(defaultValue: 0)
  @override
  final double tipAmount;
  @JsonKey(defaultValue: 0)
  @override
  final double subTotal;
  @JsonKey(defaultValue: 0)
  @override
  final double tax;
  @JsonKey(defaultValue: 0)
  @override
  final double deliveryCharges;
  @JsonKey(defaultValue: 0)
  @override
  final double grandTotal;
  @JsonKey(defaultValue: 'USER_APP')
  @override // UserAddress? address,
  final String orderFrom;
  @JsonKey(defaultValue: 'COD')
  @override
  final String paymentType;
  @JsonKey(defaultValue: false)
  @override
  final bool isWalletUsed;
  @JsonKey(defaultValue: 0)
  @override
  final double usedWalletAmount;

  @override
  String toString() {
    return 'Cart(vendorId: $vendorId, restaurantName: $restaurantName, franchiseName: $franchiseName, franchiseId: $franchiseId, preparationTime: $preparationTime, products: $products, couponCode: $couponCode, couponAmount: $couponAmount, tipAmount: $tipAmount, subTotal: $subTotal, tax: $tax, deliveryCharges: $deliveryCharges, grandTotal: $grandTotal, orderFrom: $orderFrom, paymentType: $paymentType, isWalletUsed: $isWalletUsed, usedWalletAmount: $usedWalletAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Cart &&
            (identical(other.vendorId, vendorId) ||
                const DeepCollectionEquality()
                    .equals(other.vendorId, vendorId)) &&
            (identical(other.restaurantName, restaurantName) ||
                const DeepCollectionEquality()
                    .equals(other.restaurantName, restaurantName)) &&
            (identical(other.franchiseName, franchiseName) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseName, franchiseName)) &&
            (identical(other.franchiseId, franchiseId) ||
                const DeepCollectionEquality()
                    .equals(other.franchiseId, franchiseId)) &&
            (identical(other.preparationTime, preparationTime) ||
                const DeepCollectionEquality()
                    .equals(other.preparationTime, preparationTime)) &&
            (identical(other.products, products) ||
                const DeepCollectionEquality()
                    .equals(other.products, products)) &&
            (identical(other.couponCode, couponCode) ||
                const DeepCollectionEquality()
                    .equals(other.couponCode, couponCode)) &&
            (identical(other.couponAmount, couponAmount) ||
                const DeepCollectionEquality()
                    .equals(other.couponAmount, couponAmount)) &&
            (identical(other.tipAmount, tipAmount) ||
                const DeepCollectionEquality()
                    .equals(other.tipAmount, tipAmount)) &&
            (identical(other.subTotal, subTotal) ||
                const DeepCollectionEquality()
                    .equals(other.subTotal, subTotal)) &&
            (identical(other.tax, tax) ||
                const DeepCollectionEquality().equals(other.tax, tax)) &&
            (identical(other.deliveryCharges, deliveryCharges) ||
                const DeepCollectionEquality()
                    .equals(other.deliveryCharges, deliveryCharges)) &&
            (identical(other.grandTotal, grandTotal) ||
                const DeepCollectionEquality()
                    .equals(other.grandTotal, grandTotal)) &&
            (identical(other.orderFrom, orderFrom) ||
                const DeepCollectionEquality()
                    .equals(other.orderFrom, orderFrom)) &&
            (identical(other.paymentType, paymentType) ||
                const DeepCollectionEquality()
                    .equals(other.paymentType, paymentType)) &&
            (identical(other.isWalletUsed, isWalletUsed) ||
                const DeepCollectionEquality()
                    .equals(other.isWalletUsed, isWalletUsed)) &&
            (identical(other.usedWalletAmount, usedWalletAmount) ||
                const DeepCollectionEquality()
                    .equals(other.usedWalletAmount, usedWalletAmount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(preparationTime) ^
      const DeepCollectionEquality().hash(products) ^
      const DeepCollectionEquality().hash(couponCode) ^
      const DeepCollectionEquality().hash(couponAmount) ^
      const DeepCollectionEquality().hash(tipAmount) ^
      const DeepCollectionEquality().hash(subTotal) ^
      const DeepCollectionEquality().hash(tax) ^
      const DeepCollectionEquality().hash(deliveryCharges) ^
      const DeepCollectionEquality().hash(grandTotal) ^
      const DeepCollectionEquality().hash(orderFrom) ^
      const DeepCollectionEquality().hash(paymentType) ^
      const DeepCollectionEquality().hash(isWalletUsed) ^
      const DeepCollectionEquality().hash(usedWalletAmount);

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
      {String? vendorId,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      int? preparationTime,
      @JsonKey(name: 'cart') List<ProductDetailsResponse> products,
      String? couponCode,
      double couponAmount,
      double tipAmount,
      double subTotal,
      double tax,
      double deliveryCharges,
      double grandTotal,
      String orderFrom,
      String paymentType,
      bool isWalletUsed,
      double usedWalletAmount}) = _$_Cart;
  _Cart._() : super._();

  factory _Cart.fromJson(Map<String, dynamic> json) = _$_Cart.fromJson;

  @override
  String? get vendorId => throw _privateConstructorUsedError;
  @override
  String? get restaurantName => throw _privateConstructorUsedError;
  @override
  String? get franchiseName => throw _privateConstructorUsedError;
  @override
  String? get franchiseId => throw _privateConstructorUsedError;
  @override
  int? get preparationTime => throw _privateConstructorUsedError;
  @override
  @JsonKey(name: 'cart')
  List<ProductDetailsResponse> get products =>
      throw _privateConstructorUsedError;
  @override
  String? get couponCode => throw _privateConstructorUsedError;
  @override
  double get couponAmount => throw _privateConstructorUsedError;
  @override
  double get tipAmount => throw _privateConstructorUsedError;
  @override
  double get subTotal => throw _privateConstructorUsedError;
  @override
  double get tax => throw _privateConstructorUsedError;
  @override
  double get deliveryCharges => throw _privateConstructorUsedError;
  @override
  double get grandTotal => throw _privateConstructorUsedError;
  @override // UserAddress? address,
  String get orderFrom => throw _privateConstructorUsedError;
  @override
  String get paymentType => throw _privateConstructorUsedError;
  @override
  bool get isWalletUsed => throw _privateConstructorUsedError;
  @override
  double get usedWalletAmount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$CartCopyWith<_Cart> get copyWith => throw _privateConstructorUsedError;
}
