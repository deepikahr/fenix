import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_state.freezed.dart';

enum KIOSKMODE {
  OFF,
  PAY_CHECKOUT_PICK_PRODUCT,
  PAY_TABLE_DELIVERY_TABLE,
  PAY_CHECKOUT_DELIVERY_TABLE
}

@freezed
class SettingsState with _$SettingsState {
  const factory SettingsState({
    @Default(false) bool isLoading,
    @Default(false) bool isUpdateLoading,
    SettingsResponse? settings,
    List<MenuResponse>? menuList,
    String? themeColor,
    @Default(KIOSKMODE.OFF) KIOSKMODE kioskMode,
    String? defaultKioskModeList,
    String? menuTitle,
    String? type,
    String? orderMode,
    bool? resetCategory,
    bool? enableCall,
    bool? payOnCommand,
    bool? validatePayment,
  }) = _Default;
}
