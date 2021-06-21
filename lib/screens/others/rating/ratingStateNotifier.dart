import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_response_models/food_delivery_rating/food_delivery_rating_response.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'ratingState.dart';

class RatingStateNotifier extends StateNotifier<RatingState> {
  final API api;
  RatingStateNotifier(this.api) : super(RatingState());

  void onFoodSelect() {
    state = state.copyWith(showDeliveryRating: false, showFoodRating: true);
  }

  void onDeliverySelect() {
    state = state.copyWith(showDeliveryRating: true, showFoodRating: false);
  }

  void onFoodRating(value) {
    state = state.copyWith(restuarantRating: value);
  }

  void onDeliveryBoyRating(value) {
    state = state.copyWith(deliveryBoyRating: value);
  }

  Future<FoodDeliveryBoyRatingResponse?> getFoodDeliveryBoyRating(
      orderId) async {
    state = state.copyWith(isLoading: true);
    final res = await api.getFoodDeliveryBoyRating(orderId);
    state = state.copyWith.call(
        ratingData: res,
        restuarantRating: res?.restaurantRating?.rate ?? 0.0,
        deliveryBoyRating: res?.deliveryBoyRating?.rate ?? 0.0);
    state = state.copyWith(isLoading: false);
    return res;
  }

  Future submitDeliveryBoy(double rate, String description, String? orderId,
      String? deliveryBoyId) async {
    state = state.copyWith(isSaveRatingLoading: true);

    final response = await api.saveDeliveryBoyRating(
        rate, description, orderId, deliveryBoyId);

    state = state.copyWith.call(isSaveRatingLoading: false);

    return response;
  }

  Future submitFood(double rate, String description, String? orderId,
      String? franchiseId) async {
    state = state.copyWith(isSaveRatingLoading: true);

    final response =
        await api.saveFoodBoyRating(rate, description, orderId, franchiseId);

    state = state.copyWith.call(isSaveRatingLoading: false);

    return response;
  }
}
