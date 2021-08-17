import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'accessSettingsState.dart';

class AccessSettingsStateNotifier extends StateNotifier<AccessSettingsState> {
  final API api;
  final DB db;
  AccessSettingsStateNotifier(this.api, this.db) : super(AccessSettingsState());

  Future<LoginVerifyResponse?> submit(
      int tableNumber, int franchiseCode, String? password) async {
    state = state.copyWith(isLoading: true);

    final response =
        await api.loginVerify(tableNumber, franchiseCode, password);

    if (response != null) {
      await db.storeUserData(response.token!, response.role!, response.id!,
          response.franchiseId!, response.vendorId!);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }
}
