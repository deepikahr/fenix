import 'dart:convert';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsState.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabsStateNotifier.dart';
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



