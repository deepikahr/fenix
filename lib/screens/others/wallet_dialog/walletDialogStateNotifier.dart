import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/others/wallet_dialog/walletDialogState.dart';

class WalletDialogStateNotifier extends StateNotifier<WalletDialogState> {
  final API api;
  final DB db;
  WalletDialogStateNotifier(this.api, this.db) : super(WalletDialogState());

  void calculateAmount(double orderAmount, double walletAmount) {
    if (orderAmount <= walletAmount) {
      state = state.copyWith.call(
        remainingWalletBalance: walletAmount - orderAmount,
        showWalletDesc: true,
        showAmountNeedToPay: false,
        currencySymbol: db.getCurrencySymbol(),
      );
    } else if (orderAmount != walletAmount) {
      state = state.copyWith.call(
        remainingAmountNeedToPay: orderAmount - walletAmount,
        showWalletDesc: false,
        showAmountNeedToPay: true,
        currencySymbol: db.getCurrencySymbol(),
      );
    }
  }
}
