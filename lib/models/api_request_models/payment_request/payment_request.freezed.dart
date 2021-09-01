// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentRequest _$PaymentRequestFromJson(Map<String, dynamic> json) {
  return _PaymentRequest.fromJson(json);
}

/// @nodoc
class _$PaymentRequestTearOff {
  const _$PaymentRequestTearOff();

  _PaymentRequest call(
      {String? orderId,
      PAYMENT_TPES? paymentType,
      int? tableNumber,
      double? amount}) {
    return _PaymentRequest(
      orderId: orderId,
      paymentType: paymentType,
      tableNumber: tableNumber,
      amount: amount,
    );
  }

  PaymentRequest fromJson(Map<String, Object> json) {
    return PaymentRequest.fromJson(json);
  }
}

/// @nodoc
const $PaymentRequest = _$PaymentRequestTearOff();

/// @nodoc
mixin _$PaymentRequest {
  String? get orderId => throw _privateConstructorUsedError;
  PAYMENT_TPES? get paymentType => throw _privateConstructorUsedError;
  int? get tableNumber => throw _privateConstructorUsedError;
  double? get amount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCopyWith<PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCopyWith<$Res> {
  factory $PaymentRequestCopyWith(
          PaymentRequest value, $Res Function(PaymentRequest) then) =
      _$PaymentRequestCopyWithImpl<$Res>;
  $Res call(
      {String? orderId,
      PAYMENT_TPES? paymentType,
      int? tableNumber,
      double? amount});
}

/// @nodoc
class _$PaymentRequestCopyWithImpl<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  _$PaymentRequestCopyWithImpl(this._value, this._then);

  final PaymentRequest _value;
  // ignore: unused_field
  final $Res Function(PaymentRequest) _then;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentType = freezed,
    Object? tableNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_value.copyWith(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TPES?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentRequestCopyWith<$Res>
    implements $PaymentRequestCopyWith<$Res> {
  factory _$PaymentRequestCopyWith(
          _PaymentRequest value, $Res Function(_PaymentRequest) then) =
      __$PaymentRequestCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? orderId,
      PAYMENT_TPES? paymentType,
      int? tableNumber,
      double? amount});
}

/// @nodoc
class __$PaymentRequestCopyWithImpl<$Res>
    extends _$PaymentRequestCopyWithImpl<$Res>
    implements _$PaymentRequestCopyWith<$Res> {
  __$PaymentRequestCopyWithImpl(
      _PaymentRequest _value, $Res Function(_PaymentRequest) _then)
      : super(_value, (v) => _then(v as _PaymentRequest));

  @override
  _PaymentRequest get _value => super._value as _PaymentRequest;

  @override
  $Res call({
    Object? orderId = freezed,
    Object? paymentType = freezed,
    Object? tableNumber = freezed,
    Object? amount = freezed,
  }) {
    return _then(_PaymentRequest(
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TPES?,
      tableNumber: tableNumber == freezed
          ? _value.tableNumber
          : tableNumber // ignore: cast_nullable_to_non_nullable
              as int?,
      amount: amount == freezed
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentRequest extends _PaymentRequest {
  const _$_PaymentRequest(
      {this.orderId, this.paymentType, this.tableNumber, this.amount})
      : super._();

  factory _$_PaymentRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_PaymentRequestFromJson(json);

  @override
  final String? orderId;
  @override
  final PAYMENT_TPES? paymentType;
  @override
  final int? tableNumber;
  @override
  final double? amount;

  @override
  String toString() {
    return 'PaymentRequest(orderId: $orderId, paymentType: $paymentType, tableNumber: $tableNumber, amount: $amount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentRequest &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.paymentType, paymentType) ||
                const DeepCollectionEquality()
                    .equals(other.paymentType, paymentType)) &&
            (identical(other.tableNumber, tableNumber) ||
                const DeepCollectionEquality()
                    .equals(other.tableNumber, tableNumber)) &&
            (identical(other.amount, amount) ||
                const DeepCollectionEquality().equals(other.amount, amount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(paymentType) ^
      const DeepCollectionEquality().hash(tableNumber) ^
      const DeepCollectionEquality().hash(amount);

  @JsonKey(ignore: true)
  @override
  _$PaymentRequestCopyWith<_PaymentRequest> get copyWith =>
      __$PaymentRequestCopyWithImpl<_PaymentRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentRequestToJson(this);
  }
}

abstract class _PaymentRequest extends PaymentRequest {
  const factory _PaymentRequest(
      {String? orderId,
      PAYMENT_TPES? paymentType,
      int? tableNumber,
      double? amount}) = _$_PaymentRequest;
  const _PaymentRequest._() : super._();

  factory _PaymentRequest.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequest.fromJson;

  @override
  String? get orderId => throw _privateConstructorUsedError;
  @override
  PAYMENT_TPES? get paymentType => throw _privateConstructorUsedError;
  @override
  int? get tableNumber => throw _privateConstructorUsedError;
  @override
  double? get amount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentRequestCopyWith<_PaymentRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
