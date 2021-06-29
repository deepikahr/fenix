import 'dart:ui';

import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settingsState.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isLoading,
    SettingsResponse? settings,
    List<MenuResponse>? menuList,
    String? themeColor,
    String? menuTitle,
    String? type,
    String? orderMode,
    bool? resetCategory,
    bool? enableCall,
    bool? payOnCommand,
    bool? validatePayment
  }) = _Default;
}
