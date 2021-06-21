import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/banner/banner_model.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/offer/offer.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';

import 'package:restaurant_saas/models/base_model.dart';

part 'home_data_response.freezed.dart';
part 'home_data_response.g.dart';

@freezed
class HomeDataResponse with BaseModel<HomeDataResponse>, _$HomeDataResponse {
  const HomeDataResponse._();

  const factory HomeDataResponse({
    @Default([]) List<Product> products,
    @Default([]) List<Brand> brands,
    @Default([]) List<BannerModel> banners,
    @Default([]) List<Cuisine> cuisines,
    @Default([]) List<Restaurant> featureRestaurants,
    @Default([]) List<Restaurant> topRatedRestaurants,
    @Default([]) List<Restaurant> nearByRestaurants,
    @Default([]) List<Offer> offerForYou,
  }) = _HomeDataResponse;

  factory HomeDataResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeDataResponseFromJson(json);

  @override
  HomeDataResponse fromMap(Map<String, dynamic> map) {
    return HomeDataResponse.fromJson(map);
  }

  @override
  Map<String, dynamic> toMap() {
    return toJson();
  }
}
