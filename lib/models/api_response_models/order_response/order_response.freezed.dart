// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OrderResponse _$OrderResponseFromJson(Map<String, dynamic> json) {
  return _OrderResponse.fromJson(json);
}

/// @nodoc
class _$OrderResponseTearOff {
  const _$OrderResponseTearOff();

  _OrderResponse call({@JsonKey(name: '_id') String? id, String? message}) {
    return _OrderResponse(
      id: id,
      message: message,
    );
  }

  OrderResponse fromJson(Map<String, Object> json) {
    return OrderResponse.fromJson(json);
  }
}

/// @nodoc
const $OrderResponse = _$OrderResponseTearOff();

/// @nodoc
mixin _$OrderResponse {
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OrderResponseCopyWith<OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderResponseCopyWith<$Res> {
  factory $OrderResponseCopyWith(
          OrderResponse value, $Res Function(OrderResponse) then) =
      _$OrderResponseCopyWithImpl<$Res>;
  $Res call({@JsonKey(name: '_id') String? id, String? message});
}

/// @nodoc
class _$OrderResponseCopyWithImpl<$Res>
    implements $OrderResponseCopyWith<$Res> {
  _$OrderResponseCopyWithImpl(this._value, this._then);

  final OrderResponse _value;
  // ignore: unused_field
  final $Res Function(OrderResponse) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$OrderResponseCopyWith<$Res>
    implements $OrderResponseCopyWith<$Res> {
  factory _$OrderResponseCopyWith(
          _OrderResponse value, $Res Function(_OrderResponse) then) =
      __$OrderResponseCopyWithImpl<$Res>;
  @override
  $Res call({@JsonKey(name: '_id') String? id, String? message});
}

/// @nodoc
class __$OrderResponseCopyWithImpl<$Res>
    extends _$OrderResponseCopyWithImpl<$Res>
    implements _$OrderResponseCopyWith<$Res> {
  __$OrderResponseCopyWithImpl(
      _OrderResponse _value, $Res Function(_OrderResponse) _then)
      : super(_value, (v) => _then(v as _OrderResponse));

  @override
  _OrderResponse get _value => super._value as _OrderResponse;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_OrderResponse(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OrderResponse extends _OrderResponse {
  const _$_OrderResponse({@JsonKey(name: '_id') this.id, this.message})
      : super._();

  factory _$_OrderResponse.fromJson(Map<String, dynamic> json) =>
      _$_$_OrderResponseFromJson(json);

  @override
  @JsonKey(name: '_id')
  final String? id;
  @override
  final String? message;

  @override
  String toString() {
    return 'OrderResponse(id: $id, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _OrderResponse &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$OrderResponseCopyWith<_OrderResponse> get copyWith =>
      __$OrderResponseCopyWithImpl<_OrderResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OrderResponseToJson(this);
  }
}

abstract class _OrderResponse extends OrderResponse {
  const factory _OrderResponse(
      {@JsonKey(name: '_id') String? id, String? message}) = _$_OrderResponse;
  const _OrderResponse._() : super._();

  factory _OrderResponse.fromJson(Map<String, dynamic> json) =
      _$_OrderResponse.fromJson;

  @override
  @JsonKey(name: '_id')
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OrderResponseCopyWith<_OrderResponse> get copyWith =>
      throw _privateConstructorUsedError;
}
