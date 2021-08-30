// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_status_history.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderStatusHistory _$OrderStatusHistoryFromJson(Map<String, dynamic> json) {
  return _OrderStatusHistory.fromJson(json);
}

/// @nodoc
class _$OrderStatusHistoryTearOff {
  const _$OrderStatusHistoryTearOff();

  _OrderStatusHistory call(
      {@JsonKey(name: '_id') String? id,
      int? timestamp,
      ORDER_STATUS? orderStatus,
      String? message}) {
    return _OrderStatusHistory(
      id: id,
      timestamp: timestamp,
      orderStatus: orderStatus,
      message: message,
    );
  }

  OrderStatusHistory fromJson(Map<String, Object> json) {
    return OrderStatusHistory.fromJson(json);
  }
}

/// @nodoc
const $OrderStatusHistory = _$OrderStatusHistoryTearOff();

/// @nodoc
mixin _$OrderStatusHistory {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  int? get timestamp => throw _privateConstructorUsedError;
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderStatusHistoryCopyWith<OrderStatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderStatusHistoryCopyWith<$Res> {
  factory $OrderStatusHistoryCopyWith(
          OrderStatusHistory value, $Res Function(OrderStatusHistory) then) =
      _$OrderStatusHistoryCopyWithImpl<$Res>;
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? timestamp,
      ORDER_STATUS? orderStatus,
      String? message});
}

/// @nodoc
class _$OrderStatusHistoryCopyWithImpl<$Res>
    implements $OrderStatusHistoryCopyWith<$Res> {
  _$OrderStatusHistoryCopyWithImpl(this._value, this._then);

  final OrderStatusHistory _value;
  // ignore: unused_field
  final $Res Function(OrderStatusHistory) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = freezed,
    Object? orderStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OrderStatusHistoryCopyWith<$Res>
    implements $OrderStatusHistoryCopyWith<$Res> {
  factory _$OrderStatusHistoryCopyWith(
          _OrderStatusHistory value, $Res Function(_OrderStatusHistory) then) =
      __$OrderStatusHistoryCopyWithImpl<$Res>;
  @override
  $Res call(
      {@JsonKey(name: '_id') String? id,
      int? timestamp,
      ORDER_STATUS? orderStatus,
      String? message});
}

/// @nodoc
class __$OrderStatusHistoryCopyWithImpl<$Res>
    extends _$OrderStatusHistoryCopyWithImpl<$Res>
    implements _$OrderStatusHistoryCopyWith<$Res> {
  __$OrderStatusHistoryCopyWithImpl(
      _OrderStatusHistory _value, $Res Function(_OrderStatusHistory) _then)
      : super(_value, (v) => _then(v as _OrderStatusHistory));

  @override
  _OrderStatusHistory get _value => super._value as _OrderStatusHistory;

  @override
  $Res call({
    Object? id = freezed,
    Object? timestamp = freezed,
    Object? orderStatus = freezed,
    Object? message = freezed,
  }) {
    return _then(_OrderStatusHistory(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      timestamp: timestamp == freezed
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as int?,
      orderStatus: orderStatus == freezed
          ? _value.orderStatus
          : orderStatus // ignore: cast_nullable_to_non_nullable
              as ORDER_STATUS?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderStatusHistory extends _OrderStatusHistory {
  const _$_OrderStatusHistory(
      {@JsonKey(name: '_id') this.id,
      this.timestamp,
      this.orderStatus,
      this.message})
      : super._();

  factory _$_OrderStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderStatusHistoryFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final int? timestamp;
  @override
  final ORDER_STATUS? orderStatus;
  @override
  final String? message;

  @override
  String toString() {
    return 'OrderStatusHistory(id: $id, timestamp: $timestamp, orderStatus: $orderStatus, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderStatusHistory &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.timestamp, timestamp) ||
                const DeepCollectionEquality()
                    .equals(other.timestamp, timestamp)) &&
            (identical(other.orderStatus, orderStatus) ||
                const DeepCollectionEquality()
                    .equals(other.orderStatus, orderStatus)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(timestamp) ^
      const DeepCollectionEquality().hash(orderStatus) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$OrderStatusHistoryCopyWith<_OrderStatusHistory> get copyWith =>
      __$OrderStatusHistoryCopyWithImpl<_OrderStatusHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderStatusHistoryToJson(this);
  }
}

abstract class _OrderStatusHistory extends OrderStatusHistory {
  const factory _OrderStatusHistory(
      {@JsonKey(name: '_id') String? id,
      int? timestamp,
      ORDER_STATUS? orderStatus,
      String? message}) = _$_OrderStatusHistory;
  const _OrderStatusHistory._() : super._();

  factory _OrderStatusHistory.fromJson(Map<String, dynamic> json) =
      _$_OrderStatusHistory.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  int? get timestamp => throw _privateConstructorUsedError;
  @override
  ORDER_STATUS? get orderStatus => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderStatusHistoryCopyWith<_OrderStatusHistory> get copyWith =>
      throw _privateConstructorUsedError;
}
