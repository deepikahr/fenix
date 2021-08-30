import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_status_history.freezed.dart';
part 'order_status_history.g.dart';

@freezed
class OrderStatusHistory
    with BaseModel<OrderStatusHistory>, _$OrderStatusHistory {
  const OrderStatusHistory._();

  const factory OrderStatusHistory({
    @JsonKey(name: '_id') String? id,
    int? timestamp,
    ORDER_STATUS? orderStatus,
    String? message,
  }) = _OrderStatusHistory;

  factory OrderStatusHistory.fromJson(Map<String, dynamic> json) =>
      _$OrderStatusHistoryFromJson(json);

  @override
  OrderStatusHistory fromMap(Map<String, dynamic> map) {
    return OrderStatusHistory.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
