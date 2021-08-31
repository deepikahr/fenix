import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_details_response.freezed.dart';
part 'order_details_response.g.dart';

enum ORDER_STATUS {
  @JsonValue('PENDING')
  pending,
  @JsonValue('CONFIRMED')
  confirmed,
  @JsonValue('COMPLETED')
  completed,
  @JsonValue('CANCELLED')
  cancelled,
}

@freezed
class OrderDetailsResponse
    with BaseModel<OrderDetailsResponse>, _$OrderDetailsResponse {
  const OrderDetailsResponse._();

  const factory OrderDetailsResponse({
    @JsonKey(name: '_id') String? id,
    bool? isAcceptedByDeliveryBoy,
    @Default(0) double amountPaid,
    @Default([]) List<CartProduct> cart,
    @Default(0) double grandTotal,
    @Default(0) double subTotal,
    String? paymentType,
    String? restaurantName,
    String? franchiseName,
    String? franchiseId,
    String? vendorId,
    String? userId,
    String? currencyCode,
    String? currencySymbol,
    ORDER_STATUS? orderStatus,
    int? orderID,
    int? tableNumber,
    String? createdAt,
    String? updatedAt,
  }) = _OrderDetailsResponse;

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderDetailsResponseFromJson(json);

  @override
  OrderDetailsResponse fromMap(Map<String, dynamic> map) {
    return OrderDetailsResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
