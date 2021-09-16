import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_socket_response/order_socket_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fenix_user/widgets/alertBox.dart';
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

  getOrderStatus(String? orderId, HomeTabsNotifier notifier) async {
    var request;
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
            customDialog(
              title: 'Order Denied',
              okText: 'Ok',
              status: DIALOG_STATUS.WARNING,
            );
          } else if (request.orderStatus == ORDER_STATUS.confirmed) {
            getNotifiWaiter();
            notifier.showScreen(Home());
            customDialog(
              title: 'Order Confirmed',
              okText: 'Ok',
              status: DIALOG_STATUS.WARNING,
            );
          }
        }
      }
    });
  }

  cleanCart(notifier) async {
    await cartState.deleteCart();
    await db.removeOrderId();
    SocketService().getSocket().clearListeners();
    notifier.showScreen(Thankyou());
  }

  void getNotifiWaiter() async {
    var request;
    var listenTo = URL.NOTIFI_WAITER_REQUEST_EVENT
        .replaceAll('USER_ID', DB().getId() ?? '');
    print('socket url: $listenTo');
    SocketService().getSocket().on(listenTo, (data) async {
      print('socket response $data');
      if (data != null) {
        request = CallWaiterRequest.fromJson(data);
        customDialog(
          status: DIALOG_STATUS.SUCCESS,
          title: request.description,
        );
      }
    });
  }
}
