import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'browse_by_cuisine_response.freezed.dart';

part 'browse_by_cuisine_response.g.dart';

@freezed
class BrowseByCuisineResponse
    with BaseModel<BrowseByCuisineResponse>, _$BrowseByCuisineResponse {
  const BrowseByCuisineResponse._();

  const factory BrowseByCuisineResponse(
      {@Default([]) List<Restaurant> data,
      @Default(0) int total}) = _BrowseByCuisineResponse;

  factory BrowseByCuisineResponse.fromJson(Map<String, dynamic> json) =>
      _$BrowseByCuisineResponseFromJson(json);

  @override
  BrowseByCuisineResponse fromMap(Map<String, dynamic> map) {
    return BrowseByCuisineResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
