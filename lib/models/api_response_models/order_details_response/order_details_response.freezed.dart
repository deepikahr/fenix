// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_details_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderDetailsResponse _$OrderDetailsResponseFromJson(Map<String, dynamic> json) {
  return _OrderDetailsResponse.fromJson(json);
}

/// @nodoc
class _$OrderDetailsResponseTearOff {
  const _$OrderDetailsResponseTearOff();

  _OrderDetailsResponse call(
      {@JsonKey(name: '_id') String? id,
      bool? isAcceptedByDeliveryBoy,
      double amountPaid = 0,
      List<CartProduct> cart = const [],
      double grandTotal = 0,
      double subTotal = 0,
      double tipAmount = 0,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId,
      String? currencyCode,
      String? currencySymbol,
      ORDER_STATUS? orderStatus,
      PAYMENT_STATUS? paymentStatus,
      int? orderID,
      int? tableNumber,
      String? createdAt,
      String? updatedAt}) {
    return _OrderDetailsResponse(
      id: id,
      isAcceptedByDeliveryBoy: isAcceptedByDeliveryBoy,
      amountPaid: amountPaid,
      cart: cart,
      grandTotal: grandTotal,
      subTotal: subTotal,
      tipAmount: tipAmount,
      paymentType: paymentType,
      restaurantName: restaurantName,
      franchiseName: franchiseName,
      franchiseId: franchiseId,
      vendorId: vendorId,
      userId: userId,
      currencyCode: currencyCode,
      currencySymbol: currencySymbol,
      orderStatus: orderStatus,
      paymentStatus: paymentStatus,
      orderID: orderID,
      tableNumber: tableNumber,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  OrderDetailsResponse fromJson(Map<String, Object> json) {
    return OrderDetailsResponse.fromJson(json);
  }
}

/// @nodoc
const $OrderDetailsResponse = _$OrderDetailsResponseTearOff();

/// @nodoc
mixin _$OrderDetailsResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  bool? get isAcceptedByDeliveryBoy => throw _privateConstructorUsedError;
  double get amountPaid => throw _privateConstructorUsedError;
  List<CartProduct> get cart => throw _privateConstructorUsedError;
  double get grandTotal => throw _privateConstructorUsedError;
  double get subTotal => throw _privateConstructorUsedError;
  double get tipAmount => throw _privateConstructorUsedError;
  String? get paymentType => throw _privateConstructorUsedError;
  String? get restaurantName => throw _privateConstructorUsedError;
  String? get franchiseName => throw _privateConstructorUsedError;
  String? get franchiseId => throw _privateConstructorUsedError;
  String? get vendorId => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get currencyCode => throw _privateConstructorUsedError;
  String? get currencySymbol => throw _privateConstructorUsedError;
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;
  PAYMENT_STATUS? get paymentStatus => throw _privateConstructorUsedError;
  int? get orderID => throw _privateConstructorUsedError;
  int? get tableNumber => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderDetailsResponseCopyWith<OrderDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsResponseCopyWith<$Res> {
  factory $OrderDetailsResponseCopyWith(OrderDetailsResponse value,
          $Res Function(OrderDetailsResponse) then) =
      _$OrderDetailsResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      bool? isAcceptedByDeliveryBoy,
      double amountPaid,
      List<CartProduct> cart,
      double grandTotal,
      double subTotal,
      double tipAmount,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId,
      String? currencyCode,
      String? currencySymbol,
      ORDER_STATUS? orderStatus,
      PAYMENT_STATUS? paymentStatus,
      int? orderID,
      int? tableNumber,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class _$OrderDetailsResponseCopyWithImpl<$Res>
    implements $OrderDetailsResponseCopyWith<$Res> {
  _$OrderDetailsResponseCopyWithImpl(this._value, this._then);

  final OrderDetailsResponse _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? isAcceptedByDeliveryBoy = freezed,
    Object? amountPaid = freezed,
    Object? cart = freezed,
    Object? grandTotal = freezed,
    Object? subTotal = freezed,
    Object? tipAmount = freezed,
    Object? paymentType = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? userId = freezed,
    Object? currencyCode = freezed,
    Object? currencySymbol = freezed,
    Object? orderStatus = freezed,
    Object? paymentStatus = freezed,
    Object? orderID = freezed,
    Object? tableNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAcceptedByDeliveryBoy: isAcceptedByDeliveryBoy == freezed
          ? _value.isAcceptedByDeliveryBoy
          : isAcceptedByDeliveryBoy // ignore: cast_nullable_to_non_nullable
              as bool?,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartProduct>,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: tipAmount == freezed
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: currencySymbol == freezed
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PAYMENT_STATUS?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OrderDetailsResponseCopyWith<$Res>
    implements $OrderDetailsResponseCopyWith<$Res> {
  factory _$OrderDetailsResponseCopyWith(_OrderDetailsResponse value,
          $Res Function(_OrderDetailsResponse) then) =
      __$OrderDetailsResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      bool? isAcceptedByDeliveryBoy,
      double amountPaid,
      List<CartProduct> cart,
      double grandTotal,
      double subTotal,
      double tipAmount,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId,
      String? currencyCode,
      String? currencySymbol,
      ORDER_STATUS? orderStatus,
      PAYMENT_STATUS? paymentStatus,
      int? orderID,
      int? tableNumber,
      String? createdAt,
      String? updatedAt});
}

/// @nodoc
class __$OrderDetailsResponseCopyWithImpl<$Res>
    extends _$OrderDetailsResponseCopyWithImpl<$Res>
    implements _$OrderDetailsResponseCopyWith<$Res> {
  __$OrderDetailsResponseCopyWithImpl(
      _OrderDetailsResponse _value, $Res Function(_OrderDetailsResponse) _then)
      : super(_value, (v) => _then(v as _OrderDetailsResponse));

  @override
  _OrderDetailsResponse get _value => super._value as _OrderDetailsResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? isAcceptedByDeliveryBoy = freezed,
    Object? amountPaid = freezed,
    Object? cart = freezed,
    Object? grandTotal = freezed,
    Object? subTotal = freezed,
    Object? tipAmount = freezed,
    Object? paymentType = freezed,
    Object? restaurantName = freezed,
    Object? franchiseName = freezed,
    Object? franchiseId = freezed,
    Object? vendorId = freezed,
    Object? userId = freezed,
    Object? currencyCode = freezed,
    Object? currencySymbol = freezed,
    Object? orderStatus = freezed,
    Object? paymentStatus = freezed,
    Object? orderID = freezed,
    Object? tableNumber = freezed,
    Object? createdAt = freezed,
    Object? updatedAt = freezed,
  }) {
    return _then(_OrderDetailsResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      isAcceptedByDeliveryBoy: isAcceptedByDeliveryBoy == freezed
          ? _value.isAcceptedByDeliveryBoy
          : isAcceptedByDeliveryBoy // ignore: cast_nullable_to_non_nullable
              as bool?,
      amountPaid: amountPaid == freezed
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      cart: cart == freezed
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as List<CartProduct>,
      grandTotal: grandTotal == freezed
          ? _value.grandTotal
          : grandTotal // ignore: cast_nullable_to_non_nullable
              as double,
      subTotal: subTotal == freezed
          ? _value.subTotal
          : subTotal // ignore: cast_nullable_to_non_nullable
              as double,
      tipAmount: tipAmount == freezed
          ? _value.tipAmount
          : tipAmount // ignore: cast_nullable_to_non_nullable
              as double,
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
      currencyCode: currencyCode == freezed
          ? _value.currencyCode
          : currencyCode // ignore: cast_nullable_to_non_nullable
              as String?,
      currencySymbol: currencySymbol == freezed
          ? _value.currencySymbol
          : currencySymbol // ignore: cast_nullable_to_non_nullable
              as String?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PAYMENT_STATUS?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      updatedAt: updatedAt == freezed
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderDetailsResponse extends _OrderDetailsResponse {
  const _$_OrderDetailsResponse(
      {@JsonKey(name: '_id') this.id,
      this.isAcceptedByDeliveryBoy,
      this.amountPaid = 0,
      this.cart = const [],
      this.grandTotal = 0,
      this.subTotal = 0,
      this.tipAmount = 0,
      this.paymentType,
      this.restaurantName,
      this.franchiseName,
      this.franchiseId,
      this.vendorId,
      this.userId,
      this.currencyCode,
      this.currencySymbol,
      this.orderStatus,
      this.paymentStatus,
      this.orderID,
      this.tableNumber,
      this.createdAt,
      this.updatedAt})
      : super._();

  factory _$_OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderDetailsResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final bool? isAcceptedByDeliveryBoy;
  @JsonKey(defaultValue: 0)
  @override
  final double amountPaid;
  @JsonKey(defaultValue: const [])
  @override
  final List<CartProduct> cart;
  @JsonKey(defaultValue: 0)
  @override
  final double grandTotal;
  @JsonKey(defaultValue: 0)
  @override
  final double subTotal;
  @JsonKey(defaultValue: 0)
  @override
  final double tipAmount;
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
  final String? currencyCode;
  @override
  final String? currencySymbol;
  @override
  final ORDER_STATUS? orderStatus;
  @override
  final PAYMENT_STATUS? paymentStatus;
  @override
  final int? orderID;
  @override
  final int? tableNumber;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  @override
  String toString() {
    return 'OrderDetailsResponse(id: $id, isAcceptedByDeliveryBoy: $isAcceptedByDeliveryBoy, amountPaid: $amountPaid, cart: $cart, grandTotal: $grandTotal, subTotal: $subTotal, tipAmount: $tipAmount, paymentType: $paymentType, restaurantName: $restaurantName, franchiseName: $franchiseName, franchiseId: $franchiseId, vendorId: $vendorId, userId: $userId, currencyCode: $currencyCode, currencySymbol: $currencySymbol, orderStatus: $orderStatus, paymentStatus: $paymentStatus, orderID: $orderID, tableNumber: $tableNumber, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderDetailsResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.isAcceptedByDeliveryBoy, isAcceptedByDeliveryBoy) ||
                const DeepCollectionEquality().equals(
                    other.isAcceptedByDeliveryBoy, isAcceptedByDeliveryBoy)) &&
            (identical(other.amountPaid, amountPaid) ||
                const DeepCollectionEquality()
                    .equals(other.amountPaid, amountPaid)) &&
            (identical(other.cart, cart) ||
                const DeepCollectionEquality().equals(other.cart, cart)) &&
            (identical(other.grandTotal, grandTotal) ||
                const DeepCollectionEquality()
                    .equals(other.grandTotal, grandTotal)) &&
            (identical(other.subTotal, subTotal) ||
                const DeepCollectionEquality()
                    .equals(other.subTotal, subTotal)) &&
            (identical(other.tipAmount, tipAmount) ||
                const DeepCollectionEquality()
                    .equals(other.tipAmount, tipAmount)) &&
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
                const DeepCollectionEquality().equals(other.userId, userId)) &&
            (identical(other.currencyCode, currencyCode) ||
                const DeepCollectionEquality()
                    .equals(other.currencyCode, currencyCode)) &&
            (identical(other.currencySymbol, currencySymbol) ||
                const DeepCollectionEquality()
                    .equals(other.currencySymbol, currencySymbol)) &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)) &&
            (identical(other.paymentStatus, paymentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.paymentStatus, paymentStatus)) &&
            (identical(other.orderID, orderID) ||
                const DeepCollectionEquality().equals(other.orderID, orderID)) &&
            (identical(other.tableNumber, tableNumber) || const DeepCollectionEquality().equals(other.tableNumber, tableNumber)) &&
            (identical(other.createdAt, createdAt) || const DeepCollectionEquality().equals(other.createdAt, createdAt)) &&
            (identical(other.updatedAt, updatedAt) || const DeepCollectionEquality().equals(other.updatedAt, updatedAt)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(isAcceptedByDeliveryBoy) ^
      const DeepCollectionEquality().hash(amountPaid) ^
      const DeepCollectionEquality().hash(cart) ^
      const DeepCollectionEquality().hash(grandTotal) ^
      const DeepCollectionEquality().hash(subTotal) ^
      const DeepCollectionEquality().hash(tipAmount) ^
      const DeepCollectionEquality().hash(paymentType) ^
      const DeepCollectionEquality().hash(restaurantName) ^
      const DeepCollectionEquality().hash(franchiseName) ^
      const DeepCollectionEquality().hash(franchiseId) ^
      const DeepCollectionEquality().hash(vendorId) ^
      const DeepCollectionEquality().hash(userId) ^
      const DeepCollectionEquality().hash(currencyCode) ^
      const DeepCollectionEquality().hash(currencySymbol) ^
      const DeepCollectionEquality().hash(orderStatus) ^
      const DeepCollectionEquality().hash(paymentStatus) ^
      const DeepCollectionEquality().hash(orderID) ^
      const DeepCollectionEquality().hash(tableNumber) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(updatedAt);

  @JsonKey(ignore: true)
  @override
  _$OrderDetailsResponseCopyWith<_OrderDetailsResponse> get copyWith =>
      __$OrderDetailsResponseCopyWithImpl<_OrderDetailsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderDetailsResponseToJson(this);
  }
}

abstract class _OrderDetailsResponse extends OrderDetailsResponse {
  const factory _OrderDetailsResponse(
      {@JsonKey(name: '_id') String? id,
      bool? isAcceptedByDeliveryBoy,
      double amountPaid,
      List<CartProduct> cart,
      double grandTotal,
      double subTotal,
      double tipAmount,
      String? paymentType,
      String? restaurantName,
      String? franchiseName,
      String? franchiseId,
      String? vendorId,
      String? userId,
      String? currencyCode,
      String? currencySymbol,
      ORDER_STATUS? orderStatus,
      PAYMENT_STATUS? paymentStatus,
      int? orderID,
      int? tableNumber,
      String? createdAt,
      String? updatedAt}) = _$_OrderDetailsResponse;
  const _OrderDetailsResponse._() : super._();

  factory _OrderDetailsResponse.fromJson(Map<String, dynamic> json) =
      _$_OrderDetailsResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  bool? get isAcceptedByDeliveryBoy => throw _privateConstructorUsedError;
  @override
  double get amountPaid => throw _privateConstructorUsedError;
  @override
  List<CartProduct> get cart => throw _privateConstructorUsedError;
  @override
  double get grandTotal => throw _privateConstructorUsedError;
  @override
  double get subTotal => throw _privateConstructorUsedError;
  @override
  double get tipAmount => throw _privateConstructorUsedError;
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
  String? get currencyCode => throw _privateConstructorUsedError;
  @override
  String? get currencySymbol => throw _privateConstructorUsedError;
  @override
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;
  @override
  PAYMENT_STATUS? get paymentStatus => throw _privateConstructorUsedError;
  @override
  int? get orderID => throw _privateConstructorUsedError;
  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  String? get createdAt => throw _privateConstructorUsedError;
  @override
  String? get updatedAt => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderDetailsResponseCopyWith<_OrderDetailsResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
