import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/transaction/transaction.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'transactions_response.freezed.dart';
part 'transactions_response.g.dart';

@freezed
class TransactionsResponse
    with BaseModel<TransactionsResponse>, _$TransactionsResponse {
  const TransactionsResponse._();

  const factory TransactionsResponse(
      {@Default([]) List<Transaction> data,
      @Default(0) int total}) = _TransactionsResponse;

  factory TransactionsResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionsResponseFromJson(json);

  @override
  TransactionsResponse fromMap(Map<String, dynamic> map) {
    return TransactionsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
