import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'food_rating_request.freezed.dart';
part 'food_rating_request.g.dart';

@freezed
class FoodRatingRequest with BaseModel<FoodRatingRequest>, _$FoodRatingRequest {
  const FoodRatingRequest._();

  const factory FoodRatingRequest(
      {double? rate,
      String? description,
      String? orderId,
      String? franchiseId}) = _FoodRatingRequest;
  factory FoodRatingRequest.fromJson(Map<String, dynamic> json) =>
      _$FoodRatingRequestFromJson(json);

  @override
  FoodRatingRequest fromMap(Map<String, dynamic> map) {
    return FoodRatingRequest.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
