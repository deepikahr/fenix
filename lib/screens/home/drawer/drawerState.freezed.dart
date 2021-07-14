// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'drawerState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$DrawerStateTearOff {
  const _$DrawerStateTearOff();

  _Default call({bool isLoading = false, HomeResponse? homeData}) {
    return _Default(
      isLoading: isLoading,
      homeData: homeData,
    );
  }
}

/// @nodoc
const $DrawerState = _$DrawerStateTearOff();

/// @nodoc
mixin _$DrawerState {
  bool get isLoading => throw _privateConstructorUsedError;
  HomeResponse? get homeData => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DrawerStateCopyWith<DrawerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DrawerStateCopyWith<$Res> {
  factory $DrawerStateCopyWith(
          DrawerState value, $Res Function(DrawerState) then) =
      _$DrawerStateCopyWithImpl<$Res>;
  $Res call({bool isLoading, HomeResponse? homeData});

  $HomeResponseCopyWith<$Res>? get homeData;
}

/// @nodoc
class _$DrawerStateCopyWithImpl<$Res> implements $DrawerStateCopyWith<$Res> {
  _$DrawerStateCopyWithImpl(this._value, this._then);

  final DrawerState _value;
  // ignore: unused_field
  final $Res Function(DrawerState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? homeData = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      homeData: homeData == freezed
          ? _value.homeData
          : homeData // ignore: cast_nullable_to_non_nullable
              as HomeResponse?,
    ));
  }

  @override
  $HomeResponseCopyWith<$Res>? get homeData {
    if (_value.homeData == null) {
      return null;
    }

    return $HomeResponseCopyWith<$Res>(_value.homeData!, (value) {
      return _then(_value.copyWith(homeData: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res> implements $DrawerStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call({bool isLoading, HomeResponse? homeData});

  @override
  $HomeResponseCopyWith<$Res>? get homeData;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$DrawerStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? homeData = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      homeData: homeData == freezed
          ? _value.homeData
          : homeData // ignore: cast_nullable_to_non_nullable
              as HomeResponse?,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default({this.isLoading = false, this.homeData});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final HomeResponse? homeData;

  @override
  String toString() {
    return 'DrawerState(isLoading: $isLoading, homeData: $homeData)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.homeData, homeData) ||
                const DeepCollectionEquality()
                    .equals(other.homeData, homeData)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(homeData);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements DrawerState {
  const factory _Default({bool isLoading, HomeResponse? homeData}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  HomeResponse? get homeData => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
