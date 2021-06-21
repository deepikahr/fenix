import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'browseByBrandState.dart';

class BrowseByBrandStateNotifier extends StateNotifier<BrowseByBrandState> {
  final API api;

  BrowseByBrandStateNotifier(this.api) : super(BrowseByBrandState());

  Future<void> fetchRestaurantList(String brandId) async {
    if (state.pageNumber == 1) {
      state = state.copyWith.call(isLoading: true);
    }
    final res =
        await api.browseByBrandRestaurantsList(brandId, state.pageNumber);
    if (res != null) {
      state = state.copyWith.call(
          restaurants: [...state.restaurants, ...res.data],
          pageNumber: state.pageNumber + 1,
          total: res.total);
    }
    state = state.copyWith.call(isLoading: false);
  }
}
