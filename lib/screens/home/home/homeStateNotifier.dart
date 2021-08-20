import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/models/api_response_models/language_response/language_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'homeState.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final API api;
  final DB db;
  HomeStateNotifier(this.api, this.db) : super(HomeState(isLoading: true));

  Future<HomeResponse?> fetchHome() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.home();
    state = state.copyWith.call(
      homeData: response,
      isLoading: false,
    );
  }

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

}
