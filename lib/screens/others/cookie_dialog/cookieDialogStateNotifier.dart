import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/others/cookie_dialog/cookieDialogState.dart';

class CookieDialogStateNotifier extends StateNotifier<CookieDialogState> {
  final API api;
  CookieDialogStateNotifier(this.api) : super(CookieDialogState());

  void calculateEstimatedAmount(String amount, double monetaryAmount) {
    state = state.copyWith
        .call(calculatedAmount: (double.parse(amount) / monetaryAmount));
  }
}
