import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'ordersState.dart';

class OrdersStateNotifier extends StateNotifier<OrdersState> {
  final API api;
  final DB db;
  OrdersStateNotifier(this.api, this.db) : super(OrdersState(isLoading: true));

}
