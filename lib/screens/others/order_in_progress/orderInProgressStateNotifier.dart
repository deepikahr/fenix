import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'orderInProgressState.dart';

class OrderInProgressStateNotifier extends StateNotifier<OrderInProgressState> {
  final API api;
  final DB db;
  OrderInProgressStateNotifier(this.api, this.db) : super(OrderInProgressState(isLoading: true));

}
