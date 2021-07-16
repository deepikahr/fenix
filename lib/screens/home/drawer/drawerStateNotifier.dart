import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'drawerState.dart';
import 'package:get/get.dart';

class DrawerStateNotifier extends StateNotifier<DrawerState> {
  final API api;
  final DB db;
  DrawerStateNotifier(this.api, this.db) : super(DrawerState());

  // Future<HomeResponse?> fetchHome() async {
  //   state = state.copyWith.call(isLoading: true);
  //   final response = await api.home();
  //   state = state.copyWith.call(
  //     homeData: response,
  //     isLoading: false,
  //   );
  // }

  Future<void> logout() async {
    if (db.isLoggedIn()) {
        await db.logOut();
        state = state.copyWith(isLoading: true);
        await Get.offAll(() => HomeTabs());
    }
  }

}
