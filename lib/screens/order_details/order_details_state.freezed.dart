// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'order_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$OrderDetailsStateTearOff {
  const _$OrderDetailsStateTearOff();

  _Default call(
      {bool isLoading = false,
      OrderDetailsResponse? orderDetails,
      bool divideAccount = false,
      int currentIndex = 0}) {
    return _Default(
      isLoading: isLoading,
      orderDetails: orderDetails,
      divideAccount: divideAccount,
      currentIndex: currentIndex,
    );
  }
}

/// @nodoc
const $OrderDetailsState = _$OrderDetailsStateTearOff();

/// @nodoc
mixin _$OrderDetailsState {
  bool get isLoading => throw _privateConstructorUsedError;
  OrderDetailsResponse? get orderDetails => throw _privateConstructorUsedError;
  bool get divideAccount => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $OrderDetailsStateCopyWith<OrderDetailsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OrderDetailsStateCopyWith<$Res> {
  factory $OrderDetailsStateCopyWith(
          OrderDetailsState value, $Res Function(OrderDetailsState) then) =
      _$OrderDetailsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      OrderDetailsResponse? orderDetails,
      bool divideAccount,
      int currentIndex});

  $OrderDetailsResponseCopyWith<$Res>? get orderDetails;
}

/// @nodoc
class _$OrderDetailsStateCopyWithImpl<$Res>
    implements $OrderDetailsStateCopyWith<$Res> {
  _$OrderDetailsStateCopyWithImpl(this._value, this._then);

  final OrderDetailsState _value;
  // ignore: unused_field
  final $Res Function(OrderDetailsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderDetails = freezed,
    Object? divideAccount = freezed,
    Object? currentIndex = freezed,
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
      divideAccount: divideAccount == freezed
          ? _value.divideAccount
          : divideAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
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
    implements $OrderDetailsStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      OrderDetailsResponse? orderDetails,
      bool divideAccount,
      int currentIndex});

  @override
  $OrderDetailsResponseCopyWith<$Res>? get orderDetails;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$OrderDetailsStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? orderDetails = freezed,
    Object? divideAccount = freezed,
    Object? currentIndex = freezed,
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
      divideAccount: divideAccount == freezed
          ? _value.divideAccount
          : divideAccount // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.orderDetails,
      this.divideAccount = false,
      this.currentIndex = 0});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final OrderDetailsResponse? orderDetails;
  @JsonKey(defaultValue: false)
  @override
  final bool divideAccount;
  @JsonKey(defaultValue: 0)
  @override
  final int currentIndex;

  @override
  String toString() {
    return 'OrderDetailsState(isLoading: $isLoading, orderDetails: $orderDetails, divideAccount: $divideAccount, currentIndex: $currentIndex)';
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
                    .equals(other.orderDetails, orderDetails)) &&
            (identical(other.divideAccount, divideAccount) ||
                const DeepCollectionEquality()
                    .equals(other.divideAccount, divideAccount)) &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(orderDetails) ^
      const DeepCollectionEquality().hash(divideAccount) ^
      const DeepCollectionEquality().hash(currentIndex);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements OrderDetailsState {
  const factory _Default(
      {bool isLoading,
      OrderDetailsResponse? orderDetails,
      bool divideAccount,
      int currentIndex}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  OrderDetailsResponse? get orderDetails => throw _privateConstructorUsedError;
  @override
  bool get divideAccount => throw _privateConstructorUsedError;
  @override
  int get currentIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
