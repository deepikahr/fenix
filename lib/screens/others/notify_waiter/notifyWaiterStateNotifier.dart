import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'notifyWaiterState.dart';

class NotifyWaiterStateNotifier extends StateNotifier<NotifyWaiterState> {
  final API api;
  final DB db;
  NotifyWaiterStateNotifier(this.api, this.db) : super(NotifyWaiterState(isLoading: true));

}
