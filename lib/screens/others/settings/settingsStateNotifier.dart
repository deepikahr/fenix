import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/settings_update_request/settings_update_request.dart';
import 'package:fenix_user/models/api_response_models/menu_response/menu_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/models/api_response_models/tab_setting_response/tab_setting_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'settingsState.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  final API api;
  final DB db;
  SettingsStateNotifier(this.api, this.db) : super(SettingsState(isLoading: true));

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

  Future<String?> updateSettings( bool? resetCategory,
      bool? callToWaiter,
      bool? payTypeKiosk,
      bool? validatePaymentByWaiter,
      String? themeColour,
      String? orderingMode,
      String? viewType) async {
    state = state.copyWith.call(isLoading: true);

    TabSettingResponse tabSetting = TabSettingResponse(
      resetCategory: resetCategory,
      callToWaiter: callToWaiter,
      payTypeKiosk: payTypeKiosk,
      validatePaymentByWaiter: validatePaymentByWaiter,
      themeColour: themeColour,
      orderingMode: orderingMode,
      viewType: viewType,
    );

    final response = await api.settingUpdate(SettingsUpdateRequest(tabSetting: tabSetting));
    state = state.copyWith.call(isLoading: false);

    return response;
  }


}
