import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/otp_verify_response/otp_verify_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'otpState.dart';

class OtpStateNotifier extends StateNotifier<OtpState> {
  final API api;
  final DB db;
  OtpStateNotifier(this.api, this.db) : super(OtpState(isLoading: true));

  Future<OtpVerifyResponse?> submit(
      int tableNumber, int franchiseCode, String? password) async {
    state = state.copyWith(isLoading: true);

    final response = await api.otpVerify(tableNumber, franchiseCode, password);

    if (response != null) {
      await db.storeUserData(response.token!, response.role!, response.id!, response.franchiseId!, response.vendorId!);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }

}
