import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'delivery_boy_rating_request.freezed.dart';
part 'delivery_boy_rating_request.g.dart';

@freezed
class DeliveryBoyRatingRequest
    with BaseModel<DeliveryBoyRatingRequest>, _$DeliveryBoyRatingRequest {
  const DeliveryBoyRatingRequest._();

  const factory DeliveryBoyRatingRequest(
      {double? rate,
      String? description,
      String? orderId,
      String? deliveryBoyId}) = _DeliveryBoyRatingRequest;
  factory DeliveryBoyRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$DeliveryBoyRatingRequestFromJson(json);

  @override
  DeliveryBoyRatingRequest fromMap(Map<String, dynamic> map) {
    return DeliveryBoyRatingRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
