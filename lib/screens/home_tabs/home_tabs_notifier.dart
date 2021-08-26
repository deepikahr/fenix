import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeTabsNotifier extends StateNotifier<HomeTabsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  HomeTabsNotifier(this.ref) : super(HomeTabsState());

  void showScreen(Widget screen) {
    state = state.copyWith.call(bottomBarIndex: -1, currentScreen: screen);
    if (screen is Home) changeBottomBarNavIndex(0);
  }

  void changeBottomBarNavIndex(int index) {
    state = state.copyWith(bottomBarIndex: index);
  }
}
