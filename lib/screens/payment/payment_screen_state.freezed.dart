// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'payment_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PaymentScreenStateTearOff {
  const _$PaymentScreenStateTearOff();

  _Default call({bool isLoading = false, PAYMENT_TPES? buttonName}) {
    return _Default(
      isLoading: isLoading,
      buttonName: buttonName,
    );
  }
}

/// @nodoc
const $PaymentScreenState = _$PaymentScreenStateTearOff();

/// @nodoc
mixin _$PaymentScreenState {
  bool get isLoading => throw _privateConstructorUsedError;
  PAYMENT_TPES? get buttonName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentScreenStateCopyWith<PaymentScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentScreenStateCopyWith<$Res> {
  factory $PaymentScreenStateCopyWith(
          PaymentScreenState value, $Res Function(PaymentScreenState) then) =
      _$PaymentScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, PAYMENT_TPES? buttonName});
}

/// @nodoc
class _$PaymentScreenStateCopyWithImpl<$Res>
    implements $PaymentScreenStateCopyWith<$Res> {
  _$PaymentScreenStateCopyWithImpl(this._value, this._then);

  final PaymentScreenState _value;
  // ignore: unused_field
  final $Res Function(PaymentScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? buttonName = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonName: buttonName == freezed
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TPES?,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $PaymentScreenStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, PAYMENT_TPES? buttonName});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res>
    extends _$PaymentScreenStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? buttonName = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonName: buttonName == freezed
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as PAYMENT_TPES?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.buttonName});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final PAYMENT_TPES? buttonName;

  @override
  String toString() {
    return 'PaymentScreenState(isLoading: $isLoading, buttonName: $buttonName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.buttonName, buttonName) ||
                const DeepCollectionEquality()
                    .equals(other.buttonName, buttonName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(buttonName);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements PaymentScreenState {
  const factory _Default({bool isLoading, PAYMENT_TPES? buttonName}) =
      _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  PAYMENT_TPES? get buttonName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
