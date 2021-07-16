// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'notifyWaiterState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$NotifyWaiterStateTearOff {
  const _$NotifyWaiterStateTearOff();

  _Default call({bool isLoading = false, String? selectedLanguage}) {
    return _Default(
      isLoading: isLoading,
      selectedLanguage: selectedLanguage,
    );
  }
}

/// @nodoc
const $NotifyWaiterState = _$NotifyWaiterStateTearOff();

/// @nodoc
mixin _$NotifyWaiterState {
  bool get isLoading => throw _privateConstructorUsedError;
  String? get selectedLanguage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $NotifyWaiterStateCopyWith<NotifyWaiterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotifyWaiterStateCopyWith<$Res> {
  factory $NotifyWaiterStateCopyWith(
          NotifyWaiterState value, $Res Function(NotifyWaiterState) then) =
      _$NotifyWaiterStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, String? selectedLanguage});
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
    Object? selectedLanguage = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedLanguage: selectedLanguage == freezed
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
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
  $Res call({bool isLoading, String? selectedLanguage});
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
    Object? selectedLanguage = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedLanguage: selectedLanguage == freezed
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.selectedLanguage});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final String? selectedLanguage;

  @override
  String toString() {
    return 'NotifyWaiterState(isLoading: $isLoading, selectedLanguage: $selectedLanguage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.selectedLanguage, selectedLanguage)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(selectedLanguage);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements NotifyWaiterState {
  const factory _Default({bool isLoading, String? selectedLanguage}) =
      _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  String? get selectedLanguage => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
