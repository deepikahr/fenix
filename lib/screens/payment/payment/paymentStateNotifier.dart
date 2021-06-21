import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/main.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/models/api_response_models/add_money_response/add_money_response.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/providers/cart_notifier.dart';
import 'package:stripe_payment/stripe_payment.dart';
import 'package:restaurant_saas/common/payment_utils.dart';

import 'paymentState.dart';

class PaymentStateNotifier extends StateNotifier<PaymentState> {
  final API api;
  final CartNotifier cartState;
  PaymentStateNotifier(this.api, this.cartState) : super(PaymentState());

  Future<PaymentIntentResult?> cardPayment(Cart cart) async {
    state = state.copyWith(isLoading: true);

    final paymentCart = cart.copyWith.call(
      isWalletUsed: state.usedWalletAmount > 0,
      usedWalletAmount: state.usedWalletAmount,
    );

    final paymentIntentResult = await createOrderViaStripe(paymentCart, api);
    state = state.copyWith(isLoading: false);

    return paymentIntentResult;
  }

  Future<AddMoneyResponse?> walletPayment(Cart cart) async {
    state = state.copyWith(isLoading: true);

    final paymentCart = cart.copyWith.call(
      isWalletUsed: true,
      usedWalletAmount: cart.grandTotal,
    );

    final res = await api.createOrder(paymentCart);

    state = state.copyWith(
        isLoading: false, currencySymbol: db.getCurrencySymbol());

    return res;
  }

  Future<AddMoneyResponse?> cashOnDelivery(Cart cart) async {
    state = state.copyWith(isLoading: true);

    final paymentCart = cart.copyWith.call(
      isWalletUsed: state.usedWalletAmount > 0,
      usedWalletAmount: state.usedWalletAmount,
    );

    final res = await api.createOrder(paymentCart);

    state = state.copyWith(
        isLoading: false, currencySymbol: db.getCurrencySymbol());

    return res;
  }

  Future<void> fetchAmount() async {
    state = state.copyWith(isLoading: true);
    final res = await api.fetchUserProfile();
    state = state.copyWith(
        totalWalletAmount: res?.walletAmount ?? 0,
        isLoading: false,
        currencySymbol: db.getCurrencySymbol());
  }

  void setUsedWalletAmount(double amount) {
    state = state.copyWith.call(usedWalletAmount: amount);
  }

  Future<void> clearCart() async {
    await cartState.deleteCart();
  }
}
