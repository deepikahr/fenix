// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settingsState.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SettingsStateTearOff {
  const _$SettingsStateTearOff();

  _Default call(
      {bool isLoading = false,
      bool isUpdateLoading = false,
      SettingsResponse? settings,
      List<MenuResponse>? menuList,
      String? themeColor,
      String? menuTitle,
      String? type,
      String? orderMode,
      bool? resetCategory,
      bool? enableCall,
      bool? payOnCommand,
      bool? validatePayment,
      double rating = 3}) {
    return _Default(
      isLoading: isLoading,
      isUpdateLoading: isUpdateLoading,
      settings: settings,
      menuList: menuList,
      themeColor: themeColor,
      menuTitle: menuTitle,
      type: type,
      orderMode: orderMode,
      resetCategory: resetCategory,
      enableCall: enableCall,
      payOnCommand: payOnCommand,
      validatePayment: validatePayment,
      rating: rating,
    );
  }
}

/// @nodoc
const $SettingsState = _$SettingsStateTearOff();

/// @nodoc
mixin _$SettingsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isUpdateLoading => throw _privateConstructorUsedError;
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  List<MenuResponse>? get menuList => throw _privateConstructorUsedError;
  String? get themeColor => throw _privateConstructorUsedError;
  String? get menuTitle => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get orderMode => throw _privateConstructorUsedError;
  bool? get resetCategory => throw _privateConstructorUsedError;
  bool? get enableCall => throw _privateConstructorUsedError;
  bool? get payOnCommand => throw _privateConstructorUsedError;
  bool? get validatePayment => throw _privateConstructorUsedError;
  double get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SettingsStateCopyWith<SettingsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsStateCopyWith<$Res> {
  factory $SettingsStateCopyWith(
          SettingsState value, $Res Function(SettingsState) then) =
      _$SettingsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isUpdateLoading,
      SettingsResponse? settings,
      List<MenuResponse>? menuList,
      String? themeColor,
      String? menuTitle,
      String? type,
      String? orderMode,
      bool? resetCategory,
      bool? enableCall,
      bool? payOnCommand,
      bool? validatePayment,
      double rating});

  $SettingsResponseCopyWith<$Res>? get settings;
}

/// @nodoc
class _$SettingsStateCopyWithImpl<$Res>
    implements $SettingsStateCopyWith<$Res> {
  _$SettingsStateCopyWithImpl(this._value, this._then);

  final SettingsState _value;
  // ignore: unused_field
  final $Res Function(SettingsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isUpdateLoading = freezed,
    Object? settings = freezed,
    Object? menuList = freezed,
    Object? themeColor = freezed,
    Object? menuTitle = freezed,
    Object? type = freezed,
    Object? orderMode = freezed,
    Object? resetCategory = freezed,
    Object? enableCall = freezed,
    Object? payOnCommand = freezed,
    Object? validatePayment = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateLoading: isUpdateLoading == freezed
          ? _value.isUpdateLoading
          : isUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsResponse?,
      menuList: menuList == freezed
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<MenuResponse>?,
      themeColor: themeColor == freezed
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      menuTitle: menuTitle == freezed
          ? _value.menuTitle
          : menuTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      orderMode: orderMode == freezed
          ? _value.orderMode
          : orderMode // ignore: cast_nullable_to_non_nullable
              as String?,
      resetCategory: resetCategory == freezed
          ? _value.resetCategory
          : resetCategory // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableCall: enableCall == freezed
          ? _value.enableCall
          : enableCall // ignore: cast_nullable_to_non_nullable
              as bool?,
      payOnCommand: payOnCommand == freezed
          ? _value.payOnCommand
          : payOnCommand // ignore: cast_nullable_to_non_nullable
              as bool?,
      validatePayment: validatePayment == freezed
          ? _value.validatePayment
          : validatePayment // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $SettingsResponseCopyWith<$Res>? get settings {
    if (_value.settings == null) {
      return null;
    }

    return $SettingsResponseCopyWith<$Res>(_value.settings!, (value) {
      return _then(_value.copyWith(settings: value));
    });
  }
}

/// @nodoc
abstract class _$DefaultCopyWith<$Res> implements $SettingsStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isUpdateLoading,
      SettingsResponse? settings,
      List<MenuResponse>? menuList,
      String? themeColor,
      String? menuTitle,
      String? type,
      String? orderMode,
      bool? resetCategory,
      bool? enableCall,
      bool? payOnCommand,
      bool? validatePayment,
      double rating});

  @override
  $SettingsResponseCopyWith<$Res>? get settings;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$SettingsStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isUpdateLoading = freezed,
    Object? settings = freezed,
    Object? menuList = freezed,
    Object? themeColor = freezed,
    Object? menuTitle = freezed,
    Object? type = freezed,
    Object? orderMode = freezed,
    Object? resetCategory = freezed,
    Object? enableCall = freezed,
    Object? payOnCommand = freezed,
    Object? validatePayment = freezed,
    Object? rating = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isUpdateLoading: isUpdateLoading == freezed
          ? _value.isUpdateLoading
          : isUpdateLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsResponse?,
      menuList: menuList == freezed
          ? _value.menuList
          : menuList // ignore: cast_nullable_to_non_nullable
              as List<MenuResponse>?,
      themeColor: themeColor == freezed
          ? _value.themeColor
          : themeColor // ignore: cast_nullable_to_non_nullable
              as String?,
      menuTitle: menuTitle == freezed
          ? _value.menuTitle
          : menuTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      orderMode: orderMode == freezed
          ? _value.orderMode
          : orderMode // ignore: cast_nullable_to_non_nullable
              as String?,
      resetCategory: resetCategory == freezed
          ? _value.resetCategory
          : resetCategory // ignore: cast_nullable_to_non_nullable
              as bool?,
      enableCall: enableCall == freezed
          ? _value.enableCall
          : enableCall // ignore: cast_nullable_to_non_nullable
              as bool?,
      payOnCommand: payOnCommand == freezed
          ? _value.payOnCommand
          : payOnCommand // ignore: cast_nullable_to_non_nullable
              as bool?,
      validatePayment: validatePayment == freezed
          ? _value.validatePayment
          : validatePayment // ignore: cast_nullable_to_non_nullable
              as bool?,
      rating: rating == freezed
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.isUpdateLoading = false,
      this.settings,
      this.menuList,
      this.themeColor,
      this.menuTitle,
      this.type,
      this.orderMode,
      this.resetCategory,
      this.enableCall,
      this.payOnCommand,
      this.validatePayment,
      this.rating = 3});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isUpdateLoading;
  @override
  final SettingsResponse? settings;
  @override
  final List<MenuResponse>? menuList;
  @override
  final String? themeColor;
  @override
  final String? menuTitle;
  @override
  final String? type;
  @override
  final String? orderMode;
  @override
  final bool? resetCategory;
  @override
  final bool? enableCall;
  @override
  final bool? payOnCommand;
  @override
  final bool? validatePayment;
  @JsonKey(defaultValue: 3)
  @override
  final double rating;

  @override
  String toString() {
    return 'SettingsState(isLoading: $isLoading, isUpdateLoading: $isUpdateLoading, settings: $settings, menuList: $menuList, themeColor: $themeColor, menuTitle: $menuTitle, type: $type, orderMode: $orderMode, resetCategory: $resetCategory, enableCall: $enableCall, payOnCommand: $payOnCommand, validatePayment: $validatePayment, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isUpdateLoading, isUpdateLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isUpdateLoading, isUpdateLoading)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.menuList, menuList) ||
                const DeepCollectionEquality()
                    .equals(other.menuList, menuList)) &&
            (identical(other.themeColor, themeColor) ||
                const DeepCollectionEquality()
                    .equals(other.themeColor, themeColor)) &&
            (identical(other.menuTitle, menuTitle) ||
                const DeepCollectionEquality()
                    .equals(other.menuTitle, menuTitle)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.orderMode, orderMode) ||
                const DeepCollectionEquality()
                    .equals(other.orderMode, orderMode)) &&
            (identical(other.resetCategory, resetCategory) ||
                const DeepCollectionEquality()
                    .equals(other.resetCategory, resetCategory)) &&
            (identical(other.enableCall, enableCall) ||
                const DeepCollectionEquality()
                    .equals(other.enableCall, enableCall)) &&
            (identical(other.payOnCommand, payOnCommand) ||
                const DeepCollectionEquality()
                    .equals(other.payOnCommand, payOnCommand)) &&
            (identical(other.validatePayment, validatePayment) ||
                const DeepCollectionEquality()
                    .equals(other.validatePayment, validatePayment)) &&
            (identical(other.rating, rating) ||
                const DeepCollectionEquality().equals(other.rating, rating)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isUpdateLoading) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(menuList) ^
      const DeepCollectionEquality().hash(themeColor) ^
      const DeepCollectionEquality().hash(menuTitle) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(orderMode) ^
      const DeepCollectionEquality().hash(resetCategory) ^
      const DeepCollectionEquality().hash(enableCall) ^
      const DeepCollectionEquality().hash(payOnCommand) ^
      const DeepCollectionEquality().hash(validatePayment) ^
      const DeepCollectionEquality().hash(rating);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements SettingsState {
  const factory _Default(
      {bool isLoading,
      bool isUpdateLoading,
      SettingsResponse? settings,
      List<MenuResponse>? menuList,
      String? themeColor,
      String? menuTitle,
      String? type,
      String? orderMode,
      bool? resetCategory,
      bool? enableCall,
      bool? payOnCommand,
      bool? validatePayment,
      double rating}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isUpdateLoading => throw _privateConstructorUsedError;
  @override
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  @override
  List<MenuResponse>? get menuList => throw _privateConstructorUsedError;
  @override
  String? get themeColor => throw _privateConstructorUsedError;
  @override
  String? get menuTitle => throw _privateConstructorUsedError;
  @override
  String? get type => throw _privateConstructorUsedError;
  @override
  String? get orderMode => throw _privateConstructorUsedError;
  @override
  bool? get resetCategory => throw _privateConstructorUsedError;
  @override
  bool? get enableCall => throw _privateConstructorUsedError;
  @override
  bool? get payOnCommand => throw _privateConstructorUsedError;
  @override
  bool? get validatePayment => throw _privateConstructorUsedError;
  @override
  double get rating => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
