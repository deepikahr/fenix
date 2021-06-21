import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/referralSettingDataResponse/referralSettingDataResponse.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/network/authentication_service.dart';
import 'package:restaurant_saas/models/api_response_models/add_number_response/add_number_response.dart';

import 'addNumberState.dart';

class AddNumberStateNotifier extends StateNotifier<AddNumberState> {
  final API api;
  AddNumberStateNotifier(this.api)
      : super(AddNumberState(isGetReferralLoading: true));

  final authService = AuthenticationService();

  Future<AddNumberResponse?> submit(String mobileNumber, String countryCode,
      String referralCode, ValueSetter<int?> responseCodeListener) async {
    state = state.copyWith(isLoading: true);

    final response = await api.register(mobileNumber, countryCode, referralCode,
        responseListener: (value) {
      responseCodeListener(value.responseCode);
    });

    state = state.copyWith.call(isLoading: false);

    return response;
  }

  Future<String?> googleSignIn() async {
    state = state.copyWith(isLoading: true);

    final token = await authService.googleSignIn();

    String? response;

    if (token != null) {
      response = await api.googleSignIn(token);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }

  Future<String?> facebookSignIn() async {
    state = state.copyWith(isLoading: true);

    final token = await authService.googleSignIn();

    String? response;

    if (token != null) {
      response = await api.facebookSignIn(token);
    }

    state = state.copyWith.call(isLoading: false);

    return response;
  }

  void setCountryCode(String countryCode) {
    state = state.copyWith.call(countryCode: countryCode);
  }

  Future<ReferralSettingDataResponse?> fetchReferralCode() async {
    state = state.copyWith(isGetReferralLoading: true);
    final res = await api.getLoginPageReferral();
    state = state.copyWith(referralAvailable: res, isGetReferralLoading: false);
  }
}
