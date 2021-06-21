import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/base_model.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';

part 'restaurant_response.freezed.dart';

part 'restaurant_response.g.dart';

@freezed
class RestaurantResponse
    with BaseModel<RestaurantResponse>, _$RestaurantResponse {
  const RestaurantResponse._();

  const factory RestaurantResponse({
    @Default([]) List<Restaurant> data,
    @Default(0) int total,
  }) = _RestaurantResponse;

  factory RestaurantResponse.fromJson(Map<String, dynamic> json) =>
      _$RestaurantResponseFromJson(json);

  @override
  RestaurantResponse fromMap(Map<String, dynamic> map) {
    return RestaurantResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
