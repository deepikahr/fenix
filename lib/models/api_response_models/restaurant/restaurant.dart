import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/category_response/category_response.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/discount/discount.dart';
import 'package:restaurant_saas/models/api_response_models/image/image_model.dart';
import 'package:restaurant_saas/models/api_response_models/offer/offer.dart';
import 'package:restaurant_saas/models/api_response_models/working_hours/working_hours.dart';
import 'package:restaurant_saas/models/base_model.dart';

part 'restaurant.freezed.dart';
part 'restaurant.g.dart';

@freezed
class Restaurant with BaseModel<Restaurant>, _$Restaurant {
  const Restaurant._();

  const factory Restaurant({
    @JsonKey(name: '_id') String? id,
    String? restaurantName,
    @Default(0) double averageRating,
    @Default([]) List<Cuisine> cuisines,
    String? franchiseName,
    ImageModel? logo,
    WorkingHours? workingHours,
    String? vendor,
    double? calcDistance,
    int? preparationTime,
    @Default(false) bool storeOpen,
    @Default(false) bool isFeatureRestaurant,
    @Default(false) bool isFavorite,
    @Default([]) List<CategoryResponse> categories,
    @Default([]) List<Offer> coupons,
    Discount? discount,
  }) = _Restaurant;

  factory Restaurant.fromJson(Map<String, dynamic> json) =>
      _$RestaurantFromJson(json);

  @override
  Restaurant fromMap(Map<String, dynamic> map) {
    return Restaurant.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
