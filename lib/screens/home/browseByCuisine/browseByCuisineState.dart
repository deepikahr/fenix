import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:restaurant_saas/models/api_response_models/restaurant/restaurant.dart';

part 'browseByCuisineState.freezed.dart';

@freezed
class BrowseByCuisineState with _$BrowseByCuisineState {
  const factory BrowseByCuisineState({
    @Default(false) bool isLoading,
    @Default([]) List<Restaurant> restaurants,
    @Default(0) int total,
    @Default(1) int pageNumber,
  }) = _Default;
}
