// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_socket_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderSocketRequest _$OrderSocketRequestFromJson(Map<String, dynamic> json) {
  return _OrderSocketRequest.fromJson(json);
}

/// @nodoc
class _$OrderSocketRequestTearOff {
  const _$OrderSocketRequestTearOff();

  _OrderSocketRequest call({ORDER_STATUS? orderStatus}) {
    return _OrderSocketRequest(
      orderStatus: orderStatus,
    );
  }

  OrderSocketRequest fromJson(Map<String, Object> json) {
    return OrderSocketRequest.fromJson(json);
  }
}

/// @nodoc
const $OrderSocketRequest = _$OrderSocketRequestTearOff();

/// @nodoc
mixin _$OrderSocketRequest {
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderSocketRequestCopyWith<OrderSocketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderSocketRequestCopyWith<$Res> {
  factory $OrderSocketRequestCopyWith(
          OrderSocketRequest value, $Res Function(OrderSocketRequest) then) =
      _$OrderSocketRequestCopyWithImpl<$Res>;
  $Res call({ORDER_STATUS? orderStatus});
}

/// @nodoc
class _$OrderSocketRequestCopyWithImpl<$Res>
    implements $OrderSocketRequestCopyWith<$Res> {
  _$OrderSocketRequestCopyWithImpl(this._value, this._then);

  final OrderSocketRequest _value;
  // ignore: unused_field
  final $Res Function(OrderSocketRequest) _then;

  @override
  $Res call({
    Object? orderStatus = freezed,
  }) {
    return _then(_value.copyWith(
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
    ));
  }
}

/// @nodoc
abstract class _$OrderSocketRequestCopyWith<$Res>
    implements $OrderSocketRequestCopyWith<$Res> {
  factory _$OrderSocketRequestCopyWith(
          _OrderSocketRequest value, $Res Function(_OrderSocketRequest) then) =
      __$OrderSocketRequestCopyWithImpl<$Res>;
  @override
  $Res call({ORDER_STATUS? orderStatus});
}

/// @nodoc
class __$OrderSocketRequestCopyWithImpl<$Res>
    extends _$OrderSocketRequestCopyWithImpl<$Res>
    implements _$OrderSocketRequestCopyWith<$Res> {
  __$OrderSocketRequestCopyWithImpl(
      _OrderSocketRequest _value, $Res Function(_OrderSocketRequest) _then)
      : super(_value, (v) => _then(v as _OrderSocketRequest));

  @override
  _OrderSocketRequest get _value => super._value as _OrderSocketRequest;

  @override
  $Res call({
    Object? orderStatus = freezed,
  }) {
    return _then(_OrderSocketRequest(
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderSocketRequest extends _OrderSocketRequest {
  const _$_OrderSocketRequest({this.orderStatus}) : super._();

  factory _$_OrderSocketRequest.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderSocketRequestFromJson(json);

  @override
  final ORDER_STATUS? orderStatus;

  @override
  String toString() {
    return 'OrderSocketRequest(orderStatus: $orderStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderSocketRequest &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(orderStatus);

  @JsonKey(ignore: true)
  @override
  _$OrderSocketRequestCopyWith<_OrderSocketRequest> get copyWith =>
      __$OrderSocketRequestCopyWithImpl<_OrderSocketRequest>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderSocketRequestToJson(this);
  }
}

abstract class _OrderSocketRequest extends OrderSocketRequest {
  const factory _OrderSocketRequest({ORDER_STATUS? orderStatus}) =
      _$_OrderSocketRequest;
  const _OrderSocketRequest._() : super._();

  factory _OrderSocketRequest.fromJson(Map<String, dynamic> json) =
      _$_OrderSocketRequest.fromJson;

  @override
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderSocketRequestCopyWith<_OrderSocketRequest> get copyWith =>
      throw _privateConstructorUsedError;
}
