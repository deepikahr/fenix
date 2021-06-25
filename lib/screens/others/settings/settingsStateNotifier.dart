import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
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
    state = state.copyWith.call(isLoading: false);

    return response;
  }


}
