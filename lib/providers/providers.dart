import 'dart:convert';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/auth/otp/otpState.dart';
import 'package:fenix_user/screens/auth/otp/otpStateNotifier.dart';
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

final otpProvider =
    StateNotifierProvider.autoDispose<OtpStateNotifier, OtpState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return OtpStateNotifier(api, db);
});

final settingsProvider =
StateNotifierProvider.autoDispose<SettingsStateNotifier, SettingsState>((ref) {
  final api = ref.watch(apiProvider);
  final db = ref.watch(dbProvider);
  return SettingsStateNotifier(api, db);
});