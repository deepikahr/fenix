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
    String? orderStatus,
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
