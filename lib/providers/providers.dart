import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/auth/change_password/changePasswordState.dart';
import 'package:fenix_user/screens/auth/change_password/changePasswordStateNotifier.dart';
import 'package:fenix_user/screens/auth/login/loginState.dart';
import 'package:fenix_user/screens/auth/login/loginStateNotifier.dart';
import 'package:fenix_user/screens/home/home/homeState.dart';
import 'package:fenix_user/screens/home/home/homeStateNotifier.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsState.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsStateNotifier.dart';
import 'package:fenix_user/screens/others/settings/settingsState.dart';
import 'package:fenix_user/screens/others/settings/settingsStateNotifier.dart';
import 'package:hive/hive.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:fenix_user/network/api_service.dart';

final apiProvider = Provider((ref) => API());
final dbProvider = Provider((ref) => DB());

final homeTabsProvider =
    StateNotifierProvider.autoDispose<HomeTabsStateNotifier, HomeTabsState>(
        (ref) {
  return HomeTabsStateNotifier();
});

final homeProvider =
StateNotifierProvider.autoDispose<HomeStateNotifier, HomeState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return HomeStateNotifier(api, db);
});

final loginProvider =
    StateNotifierProvider.autoDispose<LoginStateNotifier, LoginState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return LoginStateNotifier(api, db);
});

final changePasswordProvider =
StateNotifierProvider.autoDispose<ChangePasswordStateNotifier, ChangePasswordState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return ChangePasswordStateNotifier(api, db);
});

final settingsProvider =
StateNotifierProvider.autoDispose<SettingsStateNotifier, SettingsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return SettingsStateNotifier(api, db);
});