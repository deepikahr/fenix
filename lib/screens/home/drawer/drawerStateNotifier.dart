import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'drawerState.dart';

class DrawerStateNotifier extends StateNotifier<DrawerState> {
  final API api;
  final DB db;
  DrawerStateNotifier(this.api, this.db) : super(DrawerState(isLoading: true));

}
