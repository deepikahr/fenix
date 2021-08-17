import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../main.dart';
import 'homeTabsState.dart';

class HomeTabsStateNotifier extends StateNotifier<HomeTabsState> {
  HomeTabsStateNotifier() : super(HomeTabsState());

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

  // void nonTab(value) {
  //   state = state.copyWith.call(pageChanged: value);
  // }

  void onSelectLanguage(String value) {
    state = state.copyWith(selectedLanguage: value);
    db.saveLanguage(value);
  }

  Future<LanguageResponse?> fetchLanguage() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.languages();
    state = state.copyWith.call(
      languages: response!,
      isLoading: false,
    );
  }
}
