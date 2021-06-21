import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'walletState.dart';

class WalletStateNotifier extends StateNotifier<WalletState> {
  final API api;
  final DB db;
  WalletStateNotifier(this.api, this.db) : super(WalletState());

  Future<void> fetchAmount() async {
    state = state.copyWith(isLoading: true);
    final res = await api.fetchUserProfile();
    state = state.copyWith(
      amount: res?.walletAmount ?? 0,
      isLoading: false,
      currencySymbol: db.getCurrencySymbol(),
    );
  }
}
