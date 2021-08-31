import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/access_setting/access_setting_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AccessSettingsStateNotifier extends StateNotifier<AccessSettingsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  AccessSettingsStateNotifier(this.ref) : super(AccessSettingsState());

  Future<LoginVerifyResponse?> submit(
      int tableNumber, int franchiseCode, String? password) async {
    state = state.copyWith(isLoading: true);

    final response =
        await api.loginVerify(tableNumber, franchiseCode, password);

    if (response != null) {
      await db.storeUserData(
        response.token!,
        response.role!,
        response.id!,
        response.franchiseId!,
        response.vendorId!,
        response.restaurantName!,
        response.franchiseName!,
      );
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }
}
