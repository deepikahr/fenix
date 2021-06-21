import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/transaction/transaction.dart';

part 'recentTransactionsState.freezed.dart';

@freezed
class RecentTransactionsState with _$RecentTransactionsState {
  const factory RecentTransactionsState({
    @Default(false) bool isLoading,
    @Default(0) int total,
    @Default(20) int maxListSize,
    @Default(1) int pageNumber,
    @Default([]) List<Transaction> transactions,
    String? currencySymbol,
  }) = _Default;
}
