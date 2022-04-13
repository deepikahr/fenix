// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PaymentResponse _$PaymentResponseFromJson(Map<String, dynamic> json) {
  return _PaymentResponse.fromJson(json);
}

/// @nodoc
class _$PaymentResponseTearOff {
  const _$PaymentResponseTearOff();

  _PaymentResponse call(
      {@JsonKey(name: '_id') String? id,
      int? orderID,
      String? message,
      String? qrCode}) {
    return _PaymentResponse(
      id: id,
      orderID: orderID,
      message: message,
      qrCode: qrCode,
    );
  }

  PaymentResponse fromJson(Map<String, Object> json) {
    return PaymentResponse.fromJson(json);
  }
}

/// @nodoc
const $PaymentResponse = _$PaymentResponseTearOff();

/// @nodoc
mixin _$PaymentResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get orderID => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;
  String? get qrCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PaymentResponseCopyWith<PaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentResponseCopyWith<$Res> {
  factory $PaymentResponseCopyWith(
          PaymentResponse value, $Res Function(PaymentResponse) then) =
      _$PaymentResponseCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? orderID,
      String? message,
      String? qrCode});
}

/// @nodoc
class _$PaymentResponseCopyWithImpl<$Res>
    implements $PaymentResponseCopyWith<$Res> {
  _$PaymentResponseCopyWithImpl(this._value, this._then);

  final PaymentResponse _value;
  // ignore: unused_field
  final $Res Function(PaymentResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderID = freezed,
    Object? message = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$PaymentResponseCopyWith<$Res>
    implements $PaymentResponseCopyWith<$Res> {
  factory _$PaymentResponseCopyWith(
          _PaymentResponse value, $Res Function(_PaymentResponse) then) =
      __$PaymentResponseCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? orderID,
      String? message,
      String? qrCode});
}

/// @nodoc
class __$PaymentResponseCopyWithImpl<$Res>
    extends _$PaymentResponseCopyWithImpl<$Res>
    implements _$PaymentResponseCopyWith<$Res> {
  __$PaymentResponseCopyWithImpl(
      _PaymentResponse _value, $Res Function(_PaymentResponse) _then)
      : super(_value, (v) => _then(v as _PaymentResponse));

  @override
  _PaymentResponse get _value => super._value as _PaymentResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? orderID = freezed,
    Object? message = freezed,
    Object? qrCode = freezed,
  }) {
    return _then(_PaymentResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      orderID: orderID == freezed
          ? _value.orderID
          : orderID // ignore: cast_nullable_to_non_nullable
              as int?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
      qrCode: qrCode == freezed
          ? _value.qrCode
          : qrCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PaymentResponse extends _PaymentResponse {
  const _$_PaymentResponse(
      {@JsonKey(name: '_id') this.id, this.orderID, this.message, this.qrCode})
      : super._();

  factory _$_PaymentResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_PaymentResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? orderID;
  @override
  final String? message;
  @override
  final String? qrCode;

  @override
  String toString() {
    return 'PaymentResponse(id: $id, orderID: $orderID, message: $message, qrCode: $qrCode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PaymentResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.orderID, orderID) ||
                const DeepCollectionEquality()
                    .equals(other.orderID, orderID)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality()
                    .equals(other.message, message)) &&
            (identical(other.qrCode, qrCode) ||
                const DeepCollectionEquality().equals(other.qrCode, qrCode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(orderID) ^
      const DeepCollectionEquality().hash(message) ^
      const DeepCollectionEquality().hash(qrCode);

  @JsonKey(ignore: true)
  @override
  _$PaymentResponseCopyWith<_PaymentResponse> get copyWith =>
      __$PaymentResponseCopyWithImpl<_PaymentResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PaymentResponseToJson(this);
  }
}

abstract class _PaymentResponse extends PaymentResponse {
  const factory _PaymentResponse(
      {@JsonKey(name: '_id') String? id,
      int? orderID,
      String? message,
      String? qrCode}) = _$_PaymentResponse;
  const _PaymentResponse._() : super._();

  factory _PaymentResponse.fromJson(Map<String, dynamic> json) =
      _$_PaymentResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get orderID => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  String? get qrCode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PaymentResponseCopyWith<_PaymentResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
