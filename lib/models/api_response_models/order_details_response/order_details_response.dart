import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../base_model.dart';

part 'order_details_response.freezed.dart';
part 'order_details_response.g.dart';

@freezed
class OrderDetailsResponse
    with BaseModel<OrderDetailsResponse>, _$OrderDetailsResponse {
  const OrderDetailsResponse._();

  const factory OrderDetailsResponse({
    @JsonKey(name: '_id') String? id,
    bool? isAcceptedByDeliveryBoy,
    @Default([]) List<CartProduct> cart,
    double? grandTotal,
    double? subTotal,
    String? paymentType,
    String? restaurantName,
    String? franchiseName,
    String? franchiseId,
    String? vendorId,
    String? userId,
    String? currencyCode,
    String? currencySymbol,
    String? orderStatus,
    int? orderID,
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
