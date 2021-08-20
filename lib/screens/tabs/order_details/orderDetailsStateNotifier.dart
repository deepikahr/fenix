import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'orderDetailsState.dart';

class OrderDetailsStateNotifier extends StateNotifier<OrderDetailsState> {
  final API api;
  final DB db;
  OrderDetailsStateNotifier(this.api, this.db) : super(OrderDetailsState(isLoading: true));

  Future<void> fetchOrderDetails() async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.orderDetails();
    state = state.copyWith.call(
      isLoading: false,
      orderDetails: res,
    );
  }

  void onPageChanged(index) {
    state = state.copyWith(isLoading: true);
    state = state.copyWith.call(currentIndex: index);
    state = state.copyWith(isLoading: false);
  }

  void divideAccount(bool value) {
    state = state.copyWith(divideAccount: value);
  }

}
