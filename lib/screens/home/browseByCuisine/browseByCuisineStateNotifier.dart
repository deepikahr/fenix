import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'browseByCuisineState.dart';

class BrowseByCuisineStateNotifier extends StateNotifier<BrowseByCuisineState> {
  final API api;

  BrowseByCuisineStateNotifier(this.api) : super(BrowseByCuisineState());

  Future<void> fetchRestaurantList(String cuisineId) async {
    state = state.copyWith.call(isLoading: true);
    final res =
        await api.browseByCuisineRestaurantsList(cuisineId, state.pageNumber);
    if (res != null) {
      state = state.copyWith.call(
          restaurants: [...state.restaurants, ...res.data],
          pageNumber: state.pageNumber + 1,
          total: res.total);
    }
    state = state.copyWith.call(isLoading: false);
  }
}
