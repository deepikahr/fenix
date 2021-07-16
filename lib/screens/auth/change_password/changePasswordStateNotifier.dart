import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/change_password_request/change_password_request.dart';
import 'package:fenix_user/models/api_response_models/login_verify_response/login_verify_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'changePasswordState.dart';

class ChangePasswordStateNotifier extends StateNotifier<ChangePasswordState> {
  final API api;
  final DB db;
  ChangePasswordStateNotifier(this.api, this.db) : super(ChangePasswordState());

  Future<String?> submit(
      String? oldPassword, String? newPassword) async {
    state = state.copyWith(isLoading: true);

    final response = await api.changePassword(ChangePasswordRequest(
        currentPassword: oldPassword,
        newPassword: newPassword
    ));

    state = state.copyWith.call(isLoading: false);

    return response;
  }

}
