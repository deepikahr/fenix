import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';

import 'package:restaurant_saas/models/base_model.dart';

part 'order.freezed.dart';
part 'order.g.dart';

enum ORDER_STATUS {
  @JsonValue('PENDING')
  pending,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('OUT_FOR_DELIVERY')
  outForDelivery,
  @JsonValue('DELIVERED')
  delivered,
  @JsonValue('CANCELLED')
  cancelled,
  @JsonValue('READY_TO_PICKUP')
  readyToPickup,
}

@freezed
class Order with BaseModel<Order>, _$Order {
  const Order._();

  const factory Order({
    @JsonKey(name: '_id') String? id,
    String? restaurantName,
    String? franchiseName,
    double? grandTotal,
    int? preparationTime,
    ORDER_STATUS? orderStatus,
    String? createdAt,
    String? franchiseId,
    String? assignedToId,
    @Default([]) List<Product> cart,
    bool? isAcceptedByDeliveryBoy,
    int? orderID,
  }) = _Order;

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  @override
  Order fromMap(Map<String, dynamic> map) {
    return Order.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
