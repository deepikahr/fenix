import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'package:restaurant_saas/screens/view_all/view_all.dart';
import 'package:restaurant_saas/screens/view_all/view_all_state.dart';

class ViewAllStateNotifier extends StateNotifier<ViewAllState> {
  final API api;
  ViewAllStateNotifier(this.api) : super(ViewAllState());

  Future<void> fetch(
    ViewAllType type,
  ) async {
    if (state.pageNumber == 1) state = state.copyWith(isLoading: true);

    switch (type) {
      case ViewAllType.brand:
        final res = await api.brandList(state.pageNumber);
        state = state.copyWith.call(
            brands: [...state.brands, ...res?.data ?? []],
            pageNumber: state.pageNumber + 1,
            total: res?.total ?? 0);
        break;
      case ViewAllType.nearByRestaurant:
        final res = await api.nearByRestaurantsList(state.pageNumber);
        state = state.copyWith.call(
            restaurants: [...state.restaurants, ...res?.data ?? []],
            pageNumber: state.pageNumber + 1,
            total: res?.total ?? 0);
        break;
      case ViewAllType.featuredRestaurant:
        final res = await api.featuredRestaurantsList(state.pageNumber);
        state = state.copyWith.call(
            restaurants: [...state.restaurants, ...res?.data ?? []],
            pageNumber: state.pageNumber + 1,
            total: res?.total ?? 0);
        break;
      case ViewAllType.topRatedRestaurant:
        final res = await api.topRatedRestaurantsList(state.pageNumber);
        state = state.copyWith.call(
            restaurants: [...state.restaurants, ...res?.data ?? []],
            pageNumber: state.pageNumber + 1,
            total: res?.total ?? 0);
        break;
      case ViewAllType.cuisine:
        final res = await api.cuisinesList(state.pageNumber);
        state = state.copyWith.call(
            cuisines: [...state.cuisines, ...res?.data ?? []],
            pageNumber: state.pageNumber + 1,
            total: res?.total ?? 0);
        break;
      default:
        throw 'Unhandled type: $type';
    }

    state = state.copyWith(isLoading: false);
  }
}
