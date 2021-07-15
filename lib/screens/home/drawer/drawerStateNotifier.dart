import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'drawerState.dart';

class DrawerStateNotifier extends StateNotifier<DrawerState> {
  final API api;
  final DB db;
  DrawerStateNotifier(this.api, this.db) : super(DrawerState(isLoading: true));

  Future<HomeResponse?> fetchHome() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.home();
    state = state.copyWith.call(
      homeData: response,
      isLoading: false,
    );
  }

}
