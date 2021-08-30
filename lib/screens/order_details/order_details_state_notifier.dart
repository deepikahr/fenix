import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/order_details/order_details_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDetailsStateNotifier extends StateNotifier<OrderDetailsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  OrderDetailsStateNotifier(this.ref) : super(OrderDetailsState());

  Future<void> fetchOrderDetails() async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.orderDetails(db.getOrderId()!);
    state = state.copyWith.call(
      isLoading: false,
      orderDetails: res,
    );
  }

  void divideAccount(bool value) {
    state = state.copyWith(divideAccount: value);
  }
}
