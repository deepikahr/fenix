import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'favoritesState.dart';

class FavoritesStateNotifier extends StateNotifier<FavoritesState> {
  final API api;
  FavoritesStateNotifier(this.api) : super(FavoritesState());

  Future<void> fetchFavourites() async {
    if (state.pageNumber == 1) {
      state = state.copyWith(isLoading: true);
    }
    if (state.showRestaurants) {
      final res = await api.getFavouriteList(state.pageNumber);
      state = state.copyWith(
          restaurants: [...state.restaurants, ...res?.data ?? []],
          total: res?.total ?? 0,
          pageNumber: state.pageNumber + 1);
    }
    state = state.copyWith(isLoading: false);
  }

  Future<void> onRestaurantSelect() async {
    state = state.copyWith(showRestaurants: true);
    state =
        state.copyWith.call(showDishes: false, restaurants: [], pageNumber: 1);
    await fetchFavourites();
  }

  void onDishesSelect(int page) async {
    state = state.copyWith(showRestaurants: false);
    state = state.copyWith(showDishes: true);
  }

  Future<void> onRemoveFavourite(int favouriteIndex, String franchiseId) async {
    state = state.copyWith(isFavouriteLoading: true);
    state = state.copyWith(favouriteIndex: favouriteIndex);
    final res = await api.removeRestaurantFromFavourite(franchiseId);
    if (res != null) {
      state.restaurants.removeAt(favouriteIndex);
      state = state.copyWith.call(restaurants: state.restaurants);
    }
    state = state.copyWith(isFavouriteLoading: false);
  }
}
