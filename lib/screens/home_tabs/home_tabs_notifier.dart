import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/models/api_response_models/settings_response/settings_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_state.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state_notifier.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTabsNotifier extends StateNotifier<HomeTabsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  OrderInProcessStateNotifier get socketsNotifier {
    return ref.read(orderInProcess.notifier);
  }

  HomeTabsNotifier(this.ref) : super(HomeTabsState()) {
    socketsNotifier.getNotifiWaiter();
  }

  void showScreen(Widget screen) {
    state = state.copyWith.call(
      bottomBarIndex: -1,
      currentScreen: screen,
      screensHistory: [...state.screensHistory, screen],
    );
    if (screen is Home) changeBottomBarNavIndex(0);
  }

  void popScreen() {
    if (state.screensHistory.isNotEmpty) {
      final popScreen = state.screensHistory.removeLast();
      state = state.copyWith.call(
        bottomBarIndex: -1,
        currentScreen: state.screensHistory.isEmpty
            ? popScreen
            : state.screensHistory.last,
        screensHistory: state.screensHistory,
      );
      if (popScreen is Home) changeBottomBarNavIndex(0);
    }
  }

  void changeBottomBarNavIndex(int index) {
    state = state.copyWith(bottomBarIndex: index);
  }

  Future<LanguageResponse?> fetchLanguage() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.languages();
    state = state.copyWith.call(
      languages: response!,
      isLoading: false,
    );
  }

  Future<SettingsResponse?> fetchSettings() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.settings();
    state = state.copyWith.call(
      settings: response,
      settingsIsLoading: false,
    );
  }

  void onSelectLanguage(String language) {
    print('selected Language --> $language');
    final languageModel = state.languages
        .singleWhere((element) => element.languageName == language);
    state = state.copyWith(selectedLanguage: language);
    db.saveLanguage(languageModel.languageName);
    db.saveLanguageCode(languageModel.languageCode);
    Get.updateLocale(Locale(languageModel.languageCode ?? 'en'));
  }
}
