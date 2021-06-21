import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'recentTransactionsState.dart';

class RecentTransactionsStateNotifier
    extends StateNotifier<RecentTransactionsState> {
  final API api;
  final DB db;

  RecentTransactionsStateNotifier(this.api, this.db)
      : super(RecentTransactionsState());

  Future<void> fetchTransactions({
    int page = 1,
  }) async {
    if (state.pageNumber == 1) {
      state = state.copyWith(isLoading: true);
    }
    final res = await api.fetchWalletHistory(page: state.pageNumber);
    if (res != null) {
      state = state.copyWith(
          currencySymbol: db.getCurrencySymbol(),
          transactions: [...state.transactions, ...res.data],
          isLoading: false,
          pageNumber: state.pageNumber + 1,
          total: res.total);
    }
  }
}
