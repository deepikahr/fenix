import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';

import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'order_details_reposne.freezed.dart';
part 'order_details_reposne.g.dart';

enum PAYMENT_TYPES {
  @JsonValue('STRIPE')
  stripe,
  @JsonValue('COD')
  cod,
}

@freezed
class OrderDetailsDataResponse
    with BaseModel<OrderDetailsDataResponse>, _$OrderDetailsDataResponse {
  const OrderDetailsDataResponse._();

  const factory OrderDetailsDataResponse({
    @JsonKey(name: '_id') String? id,
    String? restaurantName,
    String? franchiseName,
    double? grandTotal,
    double? subTotal,
    double? tax,
    double? deliveryCharges,
    double? tipAmount,
    String? createdAt,
    @Default([]) List<Product> cart,
    ORDER_STATUS? orderStatus,
    String? couponCode,
    double? couponAmount,
    String? assignedToId,
    String? franchiseId,
    bool? isAcceptedByDeliveryBoy,
    int? orderID,
    PAYMENT_TYPES? paymentType,
  }) = _OrderDetailsDataResponse;

  factory OrderDetailsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsDataResponseFromJson(json);

  @override
  OrderDetailsDataResponse fromMap(Map<String, dynamic> map) {
    return OrderDetailsDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
