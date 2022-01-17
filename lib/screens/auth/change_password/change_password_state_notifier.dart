import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/change_password_request/change_password_request.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/change_password/change_password_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ChangePasswordStateNotifier extends StateNotifier<ChangePasswordState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  ChangePasswordStateNotifier(this.ref) : super(ChangePasswordState());

  Future<String?> submit(int? oldPassword, int? newPassword) async {
    state = state.copyWith(isLoading: true);

    final response = await api.changePassword(ChangePasswordRequest(
        currentPassword: oldPassword, newPassword: newPassword));

    state = state.copyWith.call(isLoading: false);

    return response;
  }
}
