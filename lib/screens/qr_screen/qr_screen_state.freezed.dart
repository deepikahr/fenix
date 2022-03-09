// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'qr_screen_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$QRScreenStateTearOff {
  const _$QRScreenStateTearOff();

  _Default call({bool isLoading = false}) {
    return _Default(
      isLoading: isLoading,
    );
  }
}

/// @nodoc
const $QRScreenState = _$QRScreenStateTearOff();

/// @nodoc
mixin _$QRScreenState {
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QRScreenStateCopyWith<QRScreenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QRScreenStateCopyWith<$Res> {
  factory $QRScreenStateCopyWith(
          QRScreenState value, $Res Function(QRScreenState) then) =
      _$QRScreenStateCopyWithImpl<$Res>;
  $Res call({bool isLoading});
}

/// @nodoc
class _$QRScreenStateCopyWithImpl<$Res>
    implements $QRScreenStateCopyWith<$Res> {
  _$QRScreenStateCopyWithImpl(this._value, this._then);

  final QRScreenState _value;
  // ignore: unused_field
  final $Res Function(QRScreenState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res> implements $QRScreenStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$QRScreenStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;

  @override
  String toString() {
    return 'QRScreenState(isLoading: $isLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(isLoading);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements QRScreenState {
  const factory _Default({bool isLoading}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
