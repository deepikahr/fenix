import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/food_delivery_rating/food_delivery_rating_response.dart';

part 'ratingState.freezed.dart';

@freezed
class RatingState with _$RatingState {
  const factory RatingState({
    @Default(true) bool isLoading,
    @Default(true) bool isSaveRatingLoading,
    @Default(true) bool showDeliveryRating,
    @Default(false) bool showFoodRating,
    FoodDeliveryBoyRatingResponse? ratingData,
    @Default(0.0) double restuarantRating,
    @Default(0.0) double deliveryBoyRating,
  }) = _Default;
}
