import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/settings_update_request/settings_update_request.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/models/api_response_models/tab_setting_response/tab_setting_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'settings_state.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  SettingsStateNotifier(this.ref) : super(SettingsState(isLoading: true));

  Future<SettingsResponse?> fetchSettings() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.settings();
    db.saveRestaurantDetails(
        response?.franchiseId?.restaurantName, response?.franchiseId?.nif);
    state = state.copyWith.call(
      settings: response,
      isLoading: false,
    );
  }

  String? getThemeColorFromValueForDropDown(String? val) {
    if (val != null) {
      if (['red', 'green', 'blue', 'yellow'].contains(val.toLowerCase())) {
        return val.toLowerCase();
      }
    }
    return null;
  }

  String? getMenuItemFromValueForDropDown(String? val) {
    if (val != null && state.menuList != null) {
      for (var i = 0; i < state.menuList!.length; i++) {
        if (state.menuList![i].title == val) {
          return val;
        }
      }
    }
    return null;
  }

  Future<List<MenuResponse>?> fetchMenuList() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.menuDropdown();
    state = state.copyWith.call(
      menuList: response,
      isLoading: false,
    );
  }

  Future<void> fetchKoiskMode() async {
    state = state.copyWith.call(isLoading: true);
    final response = DB().getKioskMode();
    state = state.copyWith.call(
      kioskMode: response ?? KIOSKMODE.OFF,
      isLoading: false,
    );
  }

  Future<void> logout() async {
    if (db.isLoggedIn()) {
      await db.logOut();

      state = state.copyWith(isLoading: true);
      await Get.offAll(() => LoginPage());
    }
  }

  Future<String?> setThemeColor(String? color) async {
    state = state.copyWith.call(themeColor: color);
  }

  Future<String?> setMenu(String id, title) async {
    db.saveMenuName(title);
    db.saveMenuId(id);
    state = state.copyWith.call(menuTitle: title);
  }

  Future<String?> setType(String type) async {
    db.saveType(type);
    state = state.copyWith.call(type: type);
  }

  Future<String?> setOrderMode(String orderMode) async {
    state = state.copyWith.call(orderMode: orderMode);
  }

  Future<bool?> setResetCategory(bool resetCategory) async {
    state = state.copyWith.call(resetCategory: resetCategory);
  }

  Future<bool?> setEnableCall(bool enableCall) async {
    state = state.copyWith.call(enableCall: enableCall);
  }

  Future<bool?> setPayOnCommand(bool payOnCommand) async {
    state = state.copyWith.call(payOnCommand: payOnCommand);
  }

  Future<bool?> setValidatePayment(bool validatePayment) async {
    state = state.copyWith.call(validatePayment: validatePayment);
  }

  Future<void> setKiosModeType(KIOSKMODE mode) async {
    state = state.copyWith.call(kioskMode: mode);
  }

  String? get _getCachedPrinterIpAddressFromdb => db.getPrinterIpAddress();

  String? get _getCachedPrinterport => db.getPrinterPort()?.toString() ?? null;

  void cachePrinterIpAddress(String? ipAddress) {
    if (ipAddress != null && ipAddress.isNotEmpty) {
      late final List<String> ipAddressSplit;
      if (ipAddress.contains(':')) {
        ipAddressSplit = ipAddress.split(':');
      } else if (ipAddress.contains('/')) {
        ipAddressSplit = ipAddress.split('/');
      } else {
        ipAddressSplit = [ipAddress];
      }
      db.savePrinterIpAddress(ipAddressSplit[0]);
      if (ipAddressSplit.length > 1) {
        db.savePrinterPort(ipAddressSplit[1]);
      } else {
        db.clearPrinterPort();
      }
    } else {
      db.clearPrinterIpAddress();
    }
  }

  String get getCachedIpAddress => '${_getCachedPrinterIpAddressFromdb ?? ''}'
      '${_getCachedPrinterport == null ? '' : ':${_getCachedPrinterport}'}';

  Future<String?> updateSettings(
      bool? resetCategory,
      bool? callToWaiter,
      bool? payTypeKiosk,
      bool? validatePaymentByWaiter,
      String? themeColour,
      KIOSKMODE mode,
      String? orderingMode,
      String? viewType) async {
    state = state.copyWith.call(isUpdateLoading: true);

    TabSettingResponse tabSetting = TabSettingResponse(
      resetCategory: resetCategory ?? false,
      callToWaiter: callToWaiter ?? false,
      payTypeKiosk: payTypeKiosk ?? false,
      validatePaymentByWaiter: validatePaymentByWaiter ?? false,
      themeColour: themeColour ?? 'yellow',
      orderingMode: orderingMode ?? 'printer',
      viewType: viewType ?? 'GRID',
    );
    final response =
        await api.settingUpdate(SettingsUpdateRequest(tabSetting: tabSetting));
    db.saveThemeColor(themeColour);
    db.saveType(viewType);
    db.saveKioskMode(describeEnum(mode));

    state = state.copyWith.call(isUpdateLoading: false);
    return response;
  }
}
