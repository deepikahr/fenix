import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'settingsState.dart';

class SettingsStateNotifier extends StateNotifier<SettingsState> {
  final API api;
  final DB db;
  SettingsStateNotifier(this.api, this.db) : super(SettingsState(isLoading: true));

}
