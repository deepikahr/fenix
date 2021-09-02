import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_socket_response/order_socket_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderInProcessStateNotifier extends StateNotifier<OrderInProcessState> {
  final ProviderReference ref;

  DB get db {
    return ref.read(dbProvider);
  }

  API get api {
    return ref.read(apiProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  OrderInProcessStateNotifier(this.ref) : super(OrderInProcessState());

  Future<OrderDetailsResponse?> fetchOrderDetails() async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.orderDetails(db.getOrderId()!);
    state = state.copyWith.call(isLoading: false);
    return res;
  }

  getOrderStatus(String? orderId, notifier) async {
    var request;
    SocketService().getSocket().clearListeners();
    var listenTo =
        URL.ORDER_STATUS_REQUEST_EVENT.replaceAll('ORDER_ID', orderId!);
    SocketService().getSocket().on(listenTo, (data) async {
      if (data != null) {
        request = OrderSocketRequest.fromJson(data);
        if (request != null) {
          if (request.orderStatus == ORDER_STATUS.completed) {
            cleanCart(notifier);
          } else if (request.orderStatus == ORDER_STATUS.cancelled) {
            Fluttertoast.showToast(msg: 'ORDER_IS_CANCELLED'.tr);
            await db.removeOrderId();
            notifier.showScreen(CartScreen());
          } else if (request.orderStatus == ORDER_STATUS.confirmed) {
            notifier.showScreen(OrderDetails());
          }
        }
      }
    });
  }

  cleanCart(notifier) async {
    await cartState.deleteCart();
    await db.removeOrderId();
    notifier.showScreen(Thankyou());
  }
}
