import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/order_details/order_details_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderDetailsStateNotifier extends StateNotifier<OrderDetailsState> {
  final ProviderReference ref;

  API get api {
    return ref.read(apiProvider);
  }

  DB get db {
    return ref.read(dbProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  OrderDetailsStateNotifier(this.ref) : super(OrderDetailsState());

  Future<OrderDetailsResponse?> fetchOrderDetails() async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.orderDetails(db.getOrderId()!);
    state = state.copyWith.call(isLoading: false, orderDetails: res);
    return res;
  }

  void divideAccount(bool value) {
    state = state.copyWith(divideAccount: value);
  }

  cleanCart(notifier) async {
    await cartState.deleteCart();
    SocketService().getSocket().clearListeners();
    await db.removeOrderId();
    notifier.showScreen(Thankyou());
  }
}
