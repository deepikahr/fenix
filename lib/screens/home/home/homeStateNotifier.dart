import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'homeState.dart';

class HomeStateNotifier extends StateNotifier<HomeState> {
  final API api;
  final DB db;
  HomeStateNotifier(this.api, this.db) : super(HomeState(isLoading: true));

}
