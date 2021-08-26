import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/home_response/home_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeNotifier extends StateNotifier<HomeState> {
  DB get db {
    return ref.read(dbProvider);
  }

  API get api {
    return ref.read(apiProvider);
  }

  final AutoDisposeProviderReference ref;

  HomeNotifier(this.ref) : super(HomeState());

  Future<HomeResponse?> fetchHome() async {
    state = state.copyWith.call(isLoading: true);
    final response = await api.home();
    if (ref.mounted)
      state = state.copyWith.call(
        banners: response?.banners ?? [],
        categories: response?.category ?? [],
        isLoading: false,
      );
  }
}
