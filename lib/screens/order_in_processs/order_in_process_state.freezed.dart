// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_in_process_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderInProcessStateTearOff {
  const _$OrderInProcessStateTearOff();

  _Default call({bool isLoading = false, OrderDetailsResponse? orderDetails}) {
    return _Default(
      isLoading: isLoading,
      orderDetails: orderDetails,
    );
  }
}

/// @nodoc
const $OrderInProcessState = _$OrderInProcessStateTearOff();

/// @nodoc
mixin _$OrderInProcessState {
  bool get isLoading => throw _privateConstructorUsedError;
  OrderDetailsResponse? get orderDetails => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderInProcessStateCopyWith<OrderInProcessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderInProcessStateCopyWith<$Res> {
  factory $OrderInProcessStateCopyWith(
          OrderInProcessState value, $Res Function(OrderInProcessState) then) =
      _$OrderInProcessStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, OrderDetailsResponse? orderDetails});

  $OrderDetailsResponseCopyWith<$Res>? get orderDetails;
}

/// @nodoc
class _$OrderInProcessStateCopyWithImpl<$Res>
    implements $OrderInProcessStateCopyWith<$Res> {
  _$OrderInProcessStateCopyWithImpl(this._value, this._then);

  final OrderInProcessState _value;
  // ignore: unused_field
  final $Res Function(OrderInProcessState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderDetails = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderDetails: orderDetails == freezed
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetailsResponse?,
    ));
  }

  @override
  $OrderDetailsResponseCopyWith<$Res>? get orderDetails {
    if (_value.orderDetails == null) {
      return null;
    }

    return $OrderDetailsResponseCopyWith<$Res>(_value.orderDetails!, (value) {
      return _then(_value.copyWith(orderDetails: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $OrderInProcessStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, OrderDetailsResponse? orderDetails});

  @override
  $OrderDetailsResponseCopyWith<$Res>? get orderDetails;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res>
    extends _$OrderInProcessStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderDetails = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      orderDetails: orderDetails == freezed
          ? _value.orderDetails
          : orderDetails // ignore: cast_nullable_to_non_nullable
              as OrderDetailsResponse?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.orderDetails});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final OrderDetailsResponse? orderDetails;

  @override
  String toString() {
    return 'OrderInProcessState(isLoading: $isLoading, orderDetails: $orderDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.orderDetails, orderDetails) ||
                const DeepCollectionEquality()
                    .equals(other.orderDetails, orderDetails)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(orderDetails);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements OrderInProcessState {
  const factory _Default({bool isLoading, OrderDetailsResponse? orderDetails}) =
      _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  OrderDetailsResponse? get orderDetails => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
