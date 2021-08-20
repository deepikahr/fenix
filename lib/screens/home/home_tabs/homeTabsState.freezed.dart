// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'homeTabsState.dart';

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
      bool pageChanged = false,
      int currentIndex = 0,
      String? selectedLanguage,
      List<LanguageResponse> languages = const [],
      SettingsResponse? settings,
      bool settingsIsLoading = false}) {
    return _Default(
      isLoading: isLoading,
      pageChanged: pageChanged,
      currentIndex: currentIndex,
      selectedLanguage: selectedLanguage,
      languages: languages,
      settings: settings,
      settingsIsLoading: settingsIsLoading,
    );
  }
}

/// @nodoc
const $HomeTabsState = _$HomeTabsStateTearOff();

/// @nodoc
mixin _$HomeTabsState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get pageChanged => throw _privateConstructorUsedError;
  int get currentIndex => throw _privateConstructorUsedError;
  String? get selectedLanguage => throw _privateConstructorUsedError;
  List<LanguageResponse> get languages => throw _privateConstructorUsedError;
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  bool get settingsIsLoading => throw _privateConstructorUsedError;

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
      bool pageChanged,
      int currentIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading});

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
    Object? pageChanged = freezed,
    Object? currentIndex = freezed,
    Object? selectedLanguage = freezed,
    Object? languages = freezed,
    Object? settings = freezed,
    Object? settingsIsLoading = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageChanged: pageChanged == freezed
          ? _value.pageChanged
          : pageChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
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
      bool pageChanged,
      int currentIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading});

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
    Object? pageChanged = freezed,
    Object? currentIndex = freezed,
    Object? selectedLanguage = freezed,
    Object? languages = freezed,
    Object? settings = freezed,
    Object? settingsIsLoading = freezed,
  }) {
    return _then(_Default(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      pageChanged: pageChanged == freezed
          ? _value.pageChanged
          : pageChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      currentIndex: currentIndex == freezed
          ? _value.currentIndex
          : currentIndex // ignore: cast_nullable_to_non_nullable
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
    ));
  }
}

/// @nodoc

class _$_Default implements _Default {
  const _$_Default(
      {this.isLoading = false,
      this.pageChanged = false,
      this.currentIndex = 0,
      this.selectedLanguage,
      this.languages = const [],
      this.settings,
      this.settingsIsLoading = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool pageChanged;
  @JsonKey(defaultValue: 0)
  @override
  final int currentIndex;
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

  @override
  String toString() {
    return 'HomeTabsState(isLoading: $isLoading, pageChanged: $pageChanged, currentIndex: $currentIndex, selectedLanguage: $selectedLanguage, languages: $languages, settings: $settings, settingsIsLoading: $settingsIsLoading)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Default &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.pageChanged, pageChanged) ||
                const DeepCollectionEquality()
                    .equals(other.pageChanged, pageChanged)) &&
            (identical(other.currentIndex, currentIndex) ||
                const DeepCollectionEquality()
                    .equals(other.currentIndex, currentIndex)) &&
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
                    .equals(other.settingsIsLoading, settingsIsLoading)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(pageChanged) ^
      const DeepCollectionEquality().hash(currentIndex) ^
      const DeepCollectionEquality().hash(selectedLanguage) ^
      const DeepCollectionEquality().hash(languages) ^
      const DeepCollectionEquality().hash(settings) ^
      const DeepCollectionEquality().hash(settingsIsLoading);

  @JsonKey(ignore: true)
  @override
  _$DefaultCopyWith<_Default> get copyWith =>
      __$DefaultCopyWithImpl<_Default>(this, _$identity);
}

abstract class _Default implements HomeTabsState {
  const factory _Default(
      {bool isLoading,
      bool pageChanged,
      int currentIndex,
      String? selectedLanguage,
      List<LanguageResponse> languages,
      SettingsResponse? settings,
      bool settingsIsLoading}) = _$_Default;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get pageChanged => throw _privateConstructorUsedError;
  @override
  int get currentIndex => throw _privateConstructorUsedError;
  @override
  String? get selectedLanguage => throw _privateConstructorUsedError;
  @override
  List<LanguageResponse> get languages => throw _privateConstructorUsedError;
  @override
  SettingsResponse? get settings => throw _privateConstructorUsedError;
  @override
  bool get settingsIsLoading => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DefaultCopyWith<_Default> get copyWith =>
      throw _privateConstructorUsedError;
}
