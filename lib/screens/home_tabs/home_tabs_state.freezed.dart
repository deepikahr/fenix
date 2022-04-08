// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'home_tabs_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$HomeTabsStateTearOff {
  const _$HomeTabsStateTearOff();

  _Default call(
      {bool isLoading = false,
      Widget currentScreen = const Center(child: const Text('Nothing to show')),
      int bottomBarIndex = 0,
      String? selectedLanguage,
      List<LanguageResponse> languages = const [],
      SettingsResponse? settings,
      bool settingsIsLoading = false,
      List<Widget> screensHistory = const []}) {
    return _Default(
      isLoading: isLoading,
      currentScreen: currentScreen,
      bottomBarIndex: bottomBarIndex,
      selectedLanguage: selectedLanguage,
      languages: languages,
      settings: settings,
      settingsIsLoading: settingsIsLoading,
      screensHistory: screensHistory,
    );
  }
}

/// @nodoc
const $HomeTabsState = _$HomeTabsStateTearOff();

/// @nodoc
mixin _$HomeTabsState {
  bool get isLoading => throw _privateConstructorUsedError;
  Widget get currentScreen => throw _privateConstructorUsedError;
  int get bottomBarIndex => throw _privateConstructorUsedError;
  String? get selectedLanguage => throw _privateConstructorUsedError;
  List<LanguageResponse> get languages => throw _privateConstructorUsedError;
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  bool get settingsIsLoading => throw _privateConstructorUsedError;
  List<Widget> get screensHistory => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeTabsStateCopyWith<HomeTabsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeTabsStateCopyWith<$Res> {
  factory $HomeTabsStateCopyWith(
          HomeTabsState value, $Res Function(HomeTabsState) then) =
      _$HomeTabsStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      Widget currentScreen,
      int bottomBarIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading,
      List<Widget> screensHistory});

  $SettingsResponseCopyWith<$Res>? get settings;
}

/// @nodoc
class _$HomeTabsStateCopyWithImpl<$Res>
    implements $HomeTabsStateCopyWith<$Res> {
  _$HomeTabsStateCopyWithImpl(this._value, this._then);

  final HomeTabsState _value;
  // ignore: unused_field
  final $Res Function(HomeTabsState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentScreen = freezed,
    Object? bottomBarIndex = freezed,
    Object? selectedLanguage = freezed,
    Object? languages = freezed,
    Object? settings = freezed,
    Object? settingsIsLoading = freezed,
    Object? screensHistory = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as Widget,
      bottomBarIndex: bottomBarIndex == freezed
          ? _value.bottomBarIndex
          : bottomBarIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedLanguage: selectedLanguage == freezed
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageResponse>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsResponse?,
      settingsIsLoading: settingsIsLoading == freezed
          ? _value.settingsIsLoading
          : settingsIsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      screensHistory: screensHistory == freezed
          ? _value.screensHistory
          : screensHistory // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
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
abstract class _$DefaultCopyWith<$Res> implements $HomeTabsStateCopyWith<$Res> {
  factory _$DefaultCopyWith(_Default value, $Res Function(_Default) then) =
      __$DefaultCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      Widget currentScreen,
      int bottomBarIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading,
      List<Widget> screensHistory});

  @override
  $SettingsResponseCopyWith<$Res>? get settings;
}

/// @nodoc
class __$DefaultCopyWithImpl<$Res> extends _$HomeTabsStateCopyWithImpl<$Res>
    implements _$DefaultCopyWith<$Res> {
  __$DefaultCopyWithImpl(_Default _value, $Res Function(_Default) _then)
      : super(_value, (v) => _then(v as _Default));

  @override
  _Default get _value => super._value as _Default;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? currentScreen = freezed,
    Object? bottomBarIndex = freezed,
    Object? selectedLanguage = freezed,
    Object? languages = freezed,
    Object? settings = freezed,
    Object? settingsIsLoading = freezed,
    Object? screensHistory = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      currentScreen: currentScreen == freezed
          ? _value.currentScreen
          : currentScreen // ignore: cast_nullable_to_non_nullable
              as Widget,
      bottomBarIndex: bottomBarIndex == freezed
          ? _value.bottomBarIndex
          : bottomBarIndex // ignore: cast_nullable_to_non_nullable
              as int,
      selectedLanguage: selectedLanguage == freezed
          ? _value.selectedLanguage
          : selectedLanguage // ignore: cast_nullable_to_non_nullable
              as String?,
      languages: languages == freezed
          ? _value.languages
          : languages // ignore: cast_nullable_to_non_nullable
              as List<LanguageResponse>,
      settings: settings == freezed
          ? _value.settings
          : settings // ignore: cast_nullable_to_non_nullable
              as SettingsResponse?,
      settingsIsLoading: settingsIsLoading == freezed
          ? _value.settingsIsLoading
          : settingsIsLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      screensHistory: screensHistory == freezed
          ? _value.screensHistory
          : screensHistory // ignore: cast_nullable_to_non_nullable
              as List<Widget>,
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.currentScreen = const Center(child: const Text('Nothing to show')),
      this.bottomBarIndex = 0,
      this.selectedLanguage,
      this.languages = const [],
      this.settings,
      this.settingsIsLoading = false,
      this.screensHistory = const []});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: const Center(child: const Text('Nothing to show')))
  @override
  final Widget currentScreen;
  @JsonKey(defaultValue: 0)
  @override
  final int bottomBarIndex;
  @override
  final String? selectedLanguage;
  @JsonKey(defaultValue: const [])
  @override
  final List<LanguageResponse> languages;
  @override
  final SettingsResponse? settings;
  @JsonKey(defaultValue: false)
  @override
  final bool settingsIsLoading;
  @JsonKey(defaultValue: const [])
  @override
  final List<Widget> screensHistory;

  @override
  String toString() {
    return 'HomeTabsState(isLoading: $isLoading, currentScreen: $currentScreen, bottomBarIndex: $bottomBarIndex, selectedLanguage: $selectedLanguage, languages: $languages, settings: $settings, settingsIsLoading: $settingsIsLoading, screensHistory: $screensHistory)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.currentScreen, currentScreen) ||
                const DeepCollectionEquality()
                    .equals(other.currentScreen, currentScreen)) &&
            (identical(other.bottomBarIndex, bottomBarIndex) ||
                const DeepCollectionEquality()
                    .equals(other.bottomBarIndex, bottomBarIndex)) &&
            (identical(other.selectedLanguage, selectedLanguage) ||
                const DeepCollectionEquality()
                    .equals(other.selectedLanguage, selectedLanguage)) &&
            (identical(other.languages, languages) ||
                const DeepCollectionEquality()
                    .equals(other.languages, languages)) &&
            (identical(other.settings, settings) ||
                const DeepCollectionEquality()
                    .equals(other.settings, settings)) &&
            (identical(other.settingsIsLoading, settingsIsLoading) ||
                const DeepCollectionEquality()
                    .equals(other.settingsIsLoading, settingsIsLoading)) &&
            (identical(other.screensHistory, screensHistory) ||
                const DeepCollectionEquality()
                    .equals(other.screensHistory, screensHistory)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(currentScreen) ^
      const DeepCollectionEquality().hash(bottomBarIndex) ^
      const DeepCollectionEquality().hash(selectedLanguage) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(settingsIsLoading) ^
      const DeepCollectionEquality().hash(screensHistory);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements HomeTabsState {
  const factory _Default(
      {bool isLoading,
      Widget currentScreen,
      int bottomBarIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading,
      List<Widget> screensHistory}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  Widget get currentScreen => throw _privateConstructorUsedError;
  @override
  int get bottomBarIndex => throw _privateConstructorUsedError;
  @override
  String? get selectedLanguage => throw _privateConstructorUsedError;
  @override
  List<LanguageResponse> get languages => throw _privateConstructorUsedError;
  @override
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  @override
  bool get settingsIsLoading => throw _privateConstructorUsedError;
  @override
  List<Widget> get screensHistory => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
