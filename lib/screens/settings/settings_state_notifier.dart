import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/settings_update_request/settings_update_request.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/models/api_response_models/tab_setting_response/tab_setting_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
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
    state = state.copyWith.call(
      settings: response,
      isLoading: false,
    );
  }

  Future<List<MenuResponse>?> fetchMenuList() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.menuDropdown();
    state = state.copyWith.call(
      menuList: response,
      isLoading: false,
    );
  }

  Future<String?> setThemeColor(String color) async {
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

  Future<String?> updateSettings(
      bool? resetCategory,
      bool? callToWaiter,
      bool? payTypeKiosk,
      bool? validatePaymentByWaiter,
      String? themeColour,
      String? orderingMode,
      String? viewType) async {
    state = state.copyWith.call(isUpdateLoading: true);

    TabSettingResponse tabSetting = TabSettingResponse(
      resetCategory: resetCategory,
      callToWaiter: callToWaiter,
      payTypeKiosk: payTypeKiosk,
      validatePaymentByWaiter: validatePaymentByWaiter,
      themeColour: themeColour,
      orderingMode: orderingMode,
      viewType: viewType,
    );

    final response =
        await api.settingUpdate(SettingsUpdateRequest(tabSetting: tabSetting));
    db.saveThemeColor(themeColour);
    db.saveType(viewType);
    state = state.copyWith.call(isUpdateLoading: false);
    return response;
  }
}