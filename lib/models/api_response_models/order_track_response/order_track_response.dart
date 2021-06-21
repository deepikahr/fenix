import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/models/api_response_models/user_address/user_address.dart';
import 'package:restaurant_saas/models/base_model.dart';
import 'package:restaurant_saas/models/api_response_models/delivery_boy_info/delivery_boy_info.dart';

part 'order_track_response.freezed.dart';
part 'order_track_response.g.dart';

@freezed
class OrderTrackResponse
    with BaseModel<OrderTrackResponse>, _$OrderTrackResponse {
  const OrderTrackResponse._();

  const factory OrderTrackResponse({
    @JsonKey(name: '_id') String? id,
    DeliveryBoyInfo? assignedToId,
    String? restaurantName,
    String? franchiseName,
    int? preparationTime,
    @JsonKey(name: 'address') UserAddress? userAddress,
    ORDER_STATUS? orderStatus,
    String? orderId,
    @Default([]) List<double> userCoordinates,
    @Default([]) List<double> deliveryCoordinates,
    @Default([]) List<double> franchiseCoordinates,
  }) = _OrderTrackResponse;

  factory OrderTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$OrderTrackResponseFromJson(json);

  @override
  OrderTrackResponse fromMap(Map<String, dynamic> map) {
    return OrderTrackResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
