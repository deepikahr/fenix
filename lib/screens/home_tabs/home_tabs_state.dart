import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_tabs_state.freezed.dart';

@freezed
class HomeTabsState with _$HomeTabsState {
  const factory HomeTabsState({
    @Default(false) bool isLoading,
    @Default(Center(child: Text('Nothing to show'))) Widget currentScreen,
    @Default(0) int bottomBarIndex,
    String? selectedLanguage,
    @Default([]) List<LanguageResponse> languages,
    SettingsResponse? settings,
    @Default(false) bool settingsIsLoading,
  }) = _Default;
}
