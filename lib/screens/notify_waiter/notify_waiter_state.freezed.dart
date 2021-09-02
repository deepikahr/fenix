// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notify_waiter_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotifyWaiterStateTearOff {
  const _$NotifyWaiterStateTearOff();

  _Default call(
      {bool isLoading = false,
      bool isRequestLoading = false,
      String? buttonName}) {
    return _Default(
      isLoading: isLoading,
      isRequestLoading: isRequestLoading,
      buttonName: buttonName,
    );
  }
}

/// @nodoc
const $NotifyWaiterState = _$NotifyWaiterStateTearOff();

/// @nodoc
mixin _$NotifyWaiterState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isRequestLoading => throw _privateConstructorUsedError;
  String? get buttonName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotifyWaiterStateCopyWith<NotifyWaiterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifyWaiterStateCopyWith<$Res> {
  factory $NotifyWaiterStateCopyWith(
          NotifyWaiterState value, $Res Function(NotifyWaiterState) then) =
      _$NotifyWaiterStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, bool isRequestLoading, String? buttonName});
}

/// @nodoc
class _$NotifyWaiterStateCopyWithImpl<$Res>
    implements $NotifyWaiterStateCopyWith<$Res> {
  _$NotifyWaiterStateCopyWithImpl(this._value, this._then);

  final NotifyWaiterState _value;
  // ignore: unused_field
  final $Res Function(NotifyWaiterState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isRequestLoading = freezed,
    Object? buttonName = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequestLoading: isRequestLoading == freezed
          ? _value.isRequestLoading
          : isRequestLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonName: buttonName == freezed
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res>
    implements $NotifyWaiterStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, bool isRequestLoading, String? buttonName});
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$NotifyWaiterStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isRequestLoading = freezed,
    Object? buttonName = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isRequestLoading: isRequestLoading == freezed
          ? _value.isRequestLoading
          : isRequestLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      buttonName: buttonName == freezed
          ? _value.buttonName
          : buttonName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false, this.isRequestLoading = false, this.buttonName});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isRequestLoading;
  @override
  final String? buttonName;

  @override
  String toString() {
    return 'NotifyWaiterState(isLoading: $isLoading, isRequestLoading: $isRequestLoading, buttonName: $buttonName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isRequestLoading, isRequestLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isRequestLoading, isRequestLoading)) &&
            (identical(other.buttonName, buttonName) ||
                const DeepCollectionEquality()
                    .equals(other.buttonName, buttonName)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isRequestLoading) ^
      const DeepCollectionEquality().hash(buttonName);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements NotifyWaiterState {
  const factory _Default(
      {bool isLoading, bool isRequestLoading, String? buttonName}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isRequestLoading => throw _privateConstructorUsedError;
  @override
  String? get buttonName => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
