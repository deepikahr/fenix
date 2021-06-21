import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/models/api_response_models/otp_verify_response/otp_verify_response.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/auth/verifyNumber/verifyNumberState.dart';
import 'package:restaurant_saas/models/api_response_models/add_number_response/add_number_response.dart';

class VerifyNumberStateNotifier extends StateNotifier<VerifyNumberState> {
  final API api;
  final DB db;
  VerifyNumberStateNotifier(this.api, this.db) : super(VerifyNumberState());

  Future<OtpVerifyResponse?> submit(
      String mobileNumber, String otp, String? sId) async {
    state = state.copyWith(isLoading: true);

    final response = await api.otpVerify(mobileNumber, otp, sId);

    if (response != null) {
      await db.storeUserData(response.token, response.role, response.id);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }

  Future<AddNumberResponse?> resendOtp(
      String mobileNumber, String countryCode, String referralCode) async {
    state = state.copyWith(isLoading: true);

    final response =
        await api.register(mobileNumber, countryCode, referralCode);

    state = state.copyWith.call(isLoading: false);

    return response;
  }
}
