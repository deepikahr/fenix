import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/brand/brand.dart';
import 'package:restaurant_saas/models/api_response_models/cuisine/cuisine.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
part 'view_all_state.freezed.dart';

@freezed
class ViewAllState with _$ViewAllState {
  const factory ViewAllState({
    @Default(false) bool isLoading,
    @Default([]) List<Brand> brands,
    @Default([]) List<Cuisine> cuisines,
    @Default([]) List<Restaurant> restaurants,
    @Default([]) List<Product> products,
    @Default(0) int total,
    @Default(1) int pageNumber,
  }) = _Default;
}
