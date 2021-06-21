import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/product/product.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';
part 'searchState.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) bool isLoading,
    @Default(true) bool showRestaurants,
    @Default(false) bool showDishes,
    @Default(0) int total,
    @Default(1) int pageNumber,
    @Default([]) List<Product> products,
    @Default([]) List<Restaurant> restaurants,
    String? currencySymbol,
  }) = _Default;
}
