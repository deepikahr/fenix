import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'login_state.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  final ProviderReference ref;
  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  LoginNotifier(this.ref) : super(LoginState());

  Future<LoginVerifyResponse?> submit(
      int tableNumber, int franchiseCode, int password) async {
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
      db.saveTableNumber(tableNumber);
      db.saveFranchiseCode(franchiseCode);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }
}
