import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

enum WalletTransactionType {
  @JsonValue('ORDER_CANCELLED')
  orderCancelled,
  @JsonValue('ORDER_PAYMENT')
  orderPayment,
  @JsonValue('WALLET_TOPUP')
  walletTopup,
  @JsonValue('WALLET_TOPUP_BY_LOYALTY')
  walletTopUpByLoyalty,
}

@freezed
class Transaction with BaseModel<Transaction>, _$Transaction {
  const Transaction._();

  const factory Transaction({
    @JsonKey(name: '_id') String? id,
    String? userId,
    double? amount,
    WalletTransactionType? transactionType,
    bool? isCredited,
    int? orderID,
    DateTime? createdAt,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  @override
  Transaction fromMap(Map<String, dynamic> map) {
    return Transaction.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
