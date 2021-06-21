import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/others/cookie_screen/cookieScreenState.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/models/api_request_models/loyalty_request/loyalty_request.dart';
import 'package:restaurant_saas/models/api_response_models/loyalty/loyalty.dart';

class CookieScreenStateNotifier extends StateNotifier<CookieScreenState> {
  final API api;
  CookieScreenStateNotifier(this.api) : super(CookieScreenState());

  Future<Loyalty?> fetchLoyaltyDetails() async {
    state = state.copyWith(isLoading: true);
    final res = await api.getUserLoyalty();
    if (res != null) {
      state = state.copyWith.call(
          loyaltyPoint: res.loyaltyPoint,
          loyaltyPointMonetaryValue: res.loyaltyPointMonetaryValue);
    }
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future<void> convertLoyaltyToWalletMoney(double amount) async {
    state = state.copyWith(isButtonLoading: true);
    final res = await api
        .convertLoyaltyToWalletMoney(LoyaltyRequest(loyaltyPoint: amount));
    if (res != null) {
      await customDialog(title: res);
      await fetchLoyaltyDetails();
    }
    state = state.copyWith(isButtonLoading: false);
  }
}
