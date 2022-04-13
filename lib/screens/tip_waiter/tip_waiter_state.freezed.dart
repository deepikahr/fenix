// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'tip_waiter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TipWaiterStateTearOff {
  const _$TipWaiterStateTearOff();

  _Default call({bool isLoading = false, int? tipIndex}) {
    return _Default(
      isLoading: isLoading,
      tipIndex: tipIndex,
    );
  }
}

/// @nodoc
const $TipWaiterState = _$TipWaiterStateTearOff();

/// @nodoc
mixin _$TipWaiterState {
  bool get isLoading => throw _privateConstructorUsedError;
  int? get tipIndex => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TipWaiterStateCopyWith<TipWaiterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TipWaiterStateCopyWith<$Res> {
  factory $TipWaiterStateCopyWith(
          TipWaiterState value, $Res Function(TipWaiterState) then) =
      _$TipWaiterStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, int? tipIndex});
}

/// @nodoc
class _$TipWaiterStateCopyWithImpl<$Res>
    implements $TipWaiterStateCopyWith<$Res> {
  _$TipWaiterStateCopyWithImpl(this._value, this._then);

  final TipWaiterState _value;
  // ignore: unused_field
  final $Res Function(TipWaiterState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? tipIndex = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tipIndex: tipIndex == freezed
          ? _value.tipIndex
          : tipIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $TipWaiterStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, int? tipIndex});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$TipWaiterStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? tipIndex = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tipIndex: tipIndex == freezed
          ? _value.tipIndex
          : tipIndex // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.tipIndex});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final int? tipIndex;

  @override
  String toString() {
    return 'TipWaiterState(isLoading: $isLoading, tipIndex: $tipIndex)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.tipIndex, tipIndex) ||
                const DeepCollectionEquality()
                    .equals(other.tipIndex, tipIndex)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(tipIndex);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements TipWaiterState {
  const factory _Default({bool isLoading, int? tipIndex}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  int? get tipIndex => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
