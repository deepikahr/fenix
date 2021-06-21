import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/base_model.dart';
part 'orders_list_response.freezed.dart';
part 'orders_list_response.g.dart';

@freezed
class OrderListResponse with BaseModel<OrderListResponse>, _$OrderListResponse {
  const OrderListResponse._();

  const factory OrderListResponse({
    @Default([]) List<Order> data,
    @Default(0) int total,
  }) = _OrderListResponse;

  factory OrderListResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderListResponseFromJson(json);

  @override
  OrderListResponse fromMap(Map<String, dynamic> map) {
    return OrderListResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
