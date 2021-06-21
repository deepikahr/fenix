import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';

part 'favoritesState.freezed.dart';

@freezed
class FavoritesState with _$FavoritesState {
  const factory FavoritesState({
    @Default(true) bool showRestaurants,
    @Default(false) bool showDishes,
    @Default(false) bool isLoading,
    @Default(false) bool isFavouriteLoading,
    @Default(0) int favouriteIndex,
    @Default(0) int total,
    @Default(1) int pageNumber,
    @Default([]) List<Restaurant> restaurants,
  }) = _Default;
}
