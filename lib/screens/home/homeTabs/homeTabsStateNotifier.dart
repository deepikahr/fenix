import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/network/api_service.dart';

import 'homeTabsState.dart';

class HomeTabsStateNotifier extends StateNotifier<HomeTabsState> {
  final API api;
  HomeTabsStateNotifier(this.api) : super(HomeTabsState());

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }
}
