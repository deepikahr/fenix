import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';

part 'restaurantScreenState.freezed.dart';

@freezed
class RestaurantScreenState with _$RestaurantScreenState {
  const factory RestaurantScreenState({
    @Default(false) bool isVegOnly,
    @Default(false) bool isLoading,
    @Default(false) bool isFavouriteLoading,
    Restaurant? restaurant,
    String? currencySymbol,
  }) = _Default;
}
