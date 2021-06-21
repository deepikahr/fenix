import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/payment_utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:stripe_payment/stripe_payment.dart';

import 'addMoneyState.dart';

class AddMoneyStateNotifier extends StateNotifier<AddMoneyState> {
  final API api;
  final DB db;

  AddMoneyStateNotifier(this.api, this.db) : super(AddMoneyState());

  Future<PaymentIntentResult?> addMoney(double amount) async {
    state = state.copyWith(isLoading: true);

    final paymentIntentResult = await addMoneyToWallet(amount, api);

    state = state.copyWith(
        isLoading: false, currencySymbol: db.getCurrencySymbol());

    return paymentIntentResult;
  }

  Future<void> findCurrency() async {
    state = state.copyWith(isLoading: true);
    state = state.copyWith(
      isLoading: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }
}
