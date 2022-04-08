// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_request_completed_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentRequestCompletedResponse _$PaymentRequestCompletedResponseFromJson(
    Map<String, dynamic> json) {
  return _PaymentRequestCompletedResponse.fromJson(json);
}

/// @nodoc
class _$PaymentRequestCompletedResponseTearOff {
  const _$PaymentRequestCompletedResponseTearOff();

  _PaymentRequestCompletedResponse call(
      {@JsonKey(name: '_id') String? id,
      String? waiterId,
      PAYMENT_STATUS? paymentStatus,
      String? message,
      String? orderId,
      PAYMENT_TYPE? paymentType}) {
    return _PaymentRequestCompletedResponse(
      id: id,
      waiterId: waiterId,
      paymentStatus: paymentStatus,
      message: message,
      orderId: orderId,
      paymentType: paymentType,
    );
  }

  PaymentRequestCompletedResponse fromJson(Map<String, Object> json) {
    return PaymentRequestCompletedResponse.fromJson(json);
  }
}

/// @nodoc
const $PaymentRequestCompletedResponse =
    _$PaymentRequestCompletedResponseTearOff();

/// @nodoc
mixin _$PaymentRequestCompletedResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get waiterId => throw _privateConstructorUsedError;
  PAYMENT_STATUS? get paymentStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get orderId => throw _privateConstructorUsedError;
  PAYMENT_TYPE? get paymentType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentRequestCompletedResponseCopyWith<PaymentRequestCompletedResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentRequestCompletedResponseCopyWith<$Res> {
  factory $PaymentRequestCompletedResponseCopyWith(
          PaymentRequestCompletedResponse value,
          $Res Function(PaymentRequestCompletedResponse) then) =
      _$PaymentRequestCompletedResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? waiterId,
      PAYMENT_STATUS? paymentStatus,
      String? message,
      String? orderId,
      PAYMENT_TYPE? paymentType});
}

/// @nodoc
class _$PaymentRequestCompletedResponseCopyWithImpl<$Res>
    implements $PaymentRequestCompletedResponseCopyWith<$Res> {
  _$PaymentRequestCompletedResponseCopyWithImpl(this._value, this._then);

  final PaymentRequestCompletedResponse _value;
  // ignore: unused_field
  final $Res Function(PaymentRequestCompletedResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? waiterId = freezed,
    Object? paymentStatus = freezed,
    Object? message = freezed,
    Object? orderId = freezed,
    Object? paymentType = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      waiterId: waiterId == freezed
          ? _value.waiterId
          : waiterId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PAYMENT_STATUS?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TYPE?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentRequestCompletedResponseCopyWith<$Res>
    implements $PaymentRequestCompletedResponseCopyWith<$Res> {
  factory _$PaymentRequestCompletedResponseCopyWith(
          _PaymentRequestCompletedResponse value,
          $Res Function(_PaymentRequestCompletedResponse) then) =
      __$PaymentRequestCompletedResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      String? waiterId,
      PAYMENT_STATUS? paymentStatus,
      String? message,
      String? orderId,
      PAYMENT_TYPE? paymentType});
}

/// @nodoc
class __$PaymentRequestCompletedResponseCopyWithImpl<$Res>
    extends _$PaymentRequestCompletedResponseCopyWithImpl<$Res>
    implements _$PaymentRequestCompletedResponseCopyWith<$Res> {
  __$PaymentRequestCompletedResponseCopyWithImpl(
      _PaymentRequestCompletedResponse _value,
      $Res Function(_PaymentRequestCompletedResponse) _then)
      : super(_value, (v) => _then(v as _PaymentRequestCompletedResponse));

  @override
  _PaymentRequestCompletedResponse get _value =>
      super._value as _PaymentRequestCompletedResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? waiterId = freezed,
    Object? paymentStatus = freezed,
    Object? message = freezed,
    Object? orderId = freezed,
    Object? paymentType = freezed,
  }) {
    return _then(_PaymentRequestCompletedResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      waiterId: waiterId == freezed
          ? _value.waiterId
          : waiterId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentStatus: paymentStatus == freezed
          ? _value.paymentStatus
          : paymentStatus // ignore: cast_nullable_to_non_nullable
              as PAYMENT_STATUS?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      orderId: orderId == freezed
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String?,
      paymentType: paymentType == freezed
          ? _value.paymentType
          : paymentType // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TYPE?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentRequestCompletedResponse
    extends _PaymentRequestCompletedResponse {
  const _$_PaymentRequestCompletedResponse(
      {@JsonKey(name: '_id') this.id,
      this.waiterId,
      this.paymentStatus,
      this.message,
      this.orderId,
      this.paymentType})
      : super._();

  factory _$_PaymentRequestCompletedResponse.fromJson(
          Map<String, dynamic> json) =>
      _$_$_PaymentRequestCompletedResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? waiterId;
  @override
  final PAYMENT_STATUS? paymentStatus;
  @override
  final String? message;
  @override
  final String? orderId;
  @override
  final PAYMENT_TYPE? paymentType;

  @override
  String toString() {
    return 'PaymentRequestCompletedResponse(id: $id, waiterId: $waiterId, paymentStatus: $paymentStatus, message: $message, orderId: $orderId, paymentType: $paymentType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentRequestCompletedResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.waiterId, waiterId) ||
                const DeepCollectionEquality()
                    .equals(other.waiterId, waiterId)) &&
            (identical(other.paymentStatus, paymentStatus) ||
                const DeepCollectionEquality()
                    .equals(other.paymentStatus, paymentStatus)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.orderId, orderId) ||
                const DeepCollectionEquality()
                    .equals(other.orderId, orderId)) &&
            (identical(other.paymentType, paymentType) ||
                const DeepCollectionEquality()
                    .equals(other.paymentType, paymentType)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(waiterId) ^
      const DeepCollectionEquality().hash(paymentStatus) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(orderId) ^
      const DeepCollectionEquality().hash(paymentType);

  @JsonKey(ignore: true)
  @override
  _$PaymentRequestCompletedResponseCopyWith<_PaymentRequestCompletedResponse>
      get copyWith => __$PaymentRequestCompletedResponseCopyWithImpl<
          _PaymentRequestCompletedResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentRequestCompletedResponseToJson(this);
  }
}

abstract class _PaymentRequestCompletedResponse
    extends PaymentRequestCompletedResponse {
  const factory _PaymentRequestCompletedResponse(
      {@JsonKey(name: '_id') String? id,
      String? waiterId,
      PAYMENT_STATUS? paymentStatus,
      String? message,
      String? orderId,
      PAYMENT_TYPE? paymentType}) = _$_PaymentRequestCompletedResponse;
  const _PaymentRequestCompletedResponse._() : super._();

  factory _PaymentRequestCompletedResponse.fromJson(Map<String, dynamic> json) =
      _$_PaymentRequestCompletedResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get waiterId => throw _privateConstructorUsedError;
  @override
  PAYMENT_STATUS? get paymentStatus => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get orderId => throw _privateConstructorUsedError;
  @override
  PAYMENT_TYPE? get paymentType => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentRequestCompletedResponseCopyWith<_PaymentRequestCompletedResponse>
      get copyWith => throw _privateConstructorUsedError;
}
