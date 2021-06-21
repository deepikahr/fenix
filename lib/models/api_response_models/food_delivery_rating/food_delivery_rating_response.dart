import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/rating/rating.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'food_delivery_rating_response.freezed.dart';
part 'food_delivery_rating_response.g.dart';

@freezed
class FoodDeliveryBoyRatingResponse
    with
        BaseModel<FoodDeliveryBoyRatingResponse>,
        _$FoodDeliveryBoyRatingResponse {
  const FoodDeliveryBoyRatingResponse._();

  const factory FoodDeliveryBoyRatingResponse({
    Rating? restaurantRating,
    Rating? deliveryBoyRating,
  }) = _FoodDeliveryBoyRatingResponse;

  factory FoodDeliveryBoyRatingResponse.fromJson(Map<String, dynamic> json) =>
      _$FoodDeliveryBoyRatingResponseFromJson(json);

  @override
  FoodDeliveryBoyRatingResponse fromMap(Map<String, dynamic> map) {
    return FoodDeliveryBoyRatingResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
