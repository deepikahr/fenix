import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_service.dart';
import 'homeState.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final API api;
  final DB db;
  HomeStateNotifier(this.api, this.db) : super(HomeState(isLoading: true));

  Future<void> fetchHomeData(limit, page) async {
    state = state.copyWith(isLoading: true);
    final res = await api.homeData(limit, page);
    state =
        state.copyWith.call(homeData: res, userAddress: db.getLocalAddress());
    state = state.copyWith(isLoading: false);
  }
}
