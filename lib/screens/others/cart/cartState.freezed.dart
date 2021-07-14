// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'cartState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$CartScreenStateTearOff {
  const _$CartScreenStateTearOff();

  _Default call({bool isLoading = false, OrderResponse? orderResponse}) {
    return _Default(
      isLoading: isLoading,
      orderResponse: orderResponse,
    );
  }
}

/// @nodoc
const $CartScreenState = _$CartScreenStateTearOff();

/// @nodoc
mixin _$CartScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  OrderResponse? get orderResponse => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartScreenStateCopyWith<CartScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartScreenStateCopyWith<$Res> {
  factory $CartScreenStateCopyWith(
          CartScreenState value, $Res Function(CartScreenState) then) =
      _$CartScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, OrderResponse? orderResponse});

  $OrderResponseCopyWith<$Res>? get orderResponse;
}

/// @nodoc
class _$CartScreenStateCopyWithImpl<$Res>
    implements $CartScreenStateCopyWith<$Res> {
  _$CartScreenStateCopyWithImpl(this._value, this._then);

  final CartScreenState _value;
  // ignore: unused_field
  final $Res Function(CartScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderResponse = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderResponse: orderResponse == freezed
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse?,
    ));
  }

  @override
  $OrderResponseCopyWith<$Res>? get orderResponse {
    if (_value.orderResponse == null) {
      return null;
    }

    return $OrderResponseCopyWith<$Res>(_value.orderResponse!, (value) {
      return _then(_value.copyWith(orderResponse: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $CartScreenStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, OrderResponse? orderResponse});

  @override
  $OrderResponseCopyWith<$Res>? get orderResponse;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$CartScreenStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderResponse = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderResponse: orderResponse == freezed
          ? _value.orderResponse
          : orderResponse // ignore: cast_nullable_to_non_nullable
              as OrderResponse?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.orderResponse});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final OrderResponse? orderResponse;

  @override
  String toString() {
    return 'CartScreenState(isLoading: $isLoading, orderResponse: $orderResponse)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.orderResponse, orderResponse) ||
                const DeepCollectionEquality()
                    .equals(other.orderResponse, orderResponse)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(orderResponse);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements CartScreenState {
  const factory _Default({bool isLoading, OrderResponse? orderResponse}) =
      _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  OrderResponse? get orderResponse => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
