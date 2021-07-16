import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'homeTabsState.dart';

class HomeTabsStateNotifier extends StateNotifier<HomeTabsState> {
  HomeTabsStateNotifier() : super(HomeTabsState());

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

  void onSelectLanguage(String value) {
    state = state.copyWith(selectedLanguage: value);
  }



}
