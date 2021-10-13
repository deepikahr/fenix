import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/auth/login/login.dart';
import 'package:fenix_user/screens/drawer/drawer_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class DrawerStateNotifier extends StateNotifier<DrawerState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  DrawerStateNotifier(this.ref) : super(DrawerState());

  Future<void> logout() async {
    if (db.isLoggedIn()) {
      await db.logOut();

      state = state.copyWith(isLoading: true);
      await Get.offAll(() => LoginPage());
    }
  }

  Future<HomeResponse?> fetchHome() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.home();
    if (mounted) {
      state = state.copyWith.call(
        homeData: response,
        isLoading: false,
      );
    }
  }
}
