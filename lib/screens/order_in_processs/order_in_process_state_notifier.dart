import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/call_waiter_request/call_waiter_request.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_socket_response/order_socket_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/printer.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/cart_screen/cart_screen.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OrderInProcessStateNotifier extends StateNotifier<OrderInProcessState> {
  final ProviderReference ref;

  DB get db {
    return ref.read(dbProvider);
  }

  Cart? get cart {
    return ref.read(cartProvider);
  }

  API get api {
    return ref.read(apiProvider);
  }

  PrinterService get printerService {
    return ref.read(printerProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  OrderInProcessStateNotifier(this.ref) : super(OrderInProcessState());

  Future<OrderDetailsResponse?> fetchOrderDetails() async {
    state = state.copyWith.call(isLoading: true);
    final res = await api.orderDetails(db.getOrderId()!);
    if (mounted) state = state.copyWith.call(isLoading: false);
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
            await db.removeOrderId();
            notifier.showScreen(CartScreen());
            customDialog(
              title: 'ORDER_IS_CANCELLED',
              okText: 'Ok',
              status: DIALOG_STATUS.WARNING,
            );
          } else if (request.orderStatus == ORDER_STATUS.confirmed) {
            getNotifiWaiter();
            notifier.showScreen(Home());
            customDialog(
              title: 'Order Confirmed',
              okText: 'Ok',
              status: DIALOG_STATUS.SUCCESS,
            );
            final res = await fetchOrderDetails();
            final printResult = await printerService.printReciept(
              type: PrinterRecieptType.KITCHEN,
              products: res?.cart ?? [],
            );
            if (printResult != null) {
              customDialog(
                title: printResult,
                okText: 'Ok',
                status: DIALOG_STATUS.FAIL,
              );
            }
          }
        }
      }
    });
  }

  getUpdateOrderStatus(String? orderId, HomeTabsNotifier notifier) {
    var request;
    var listenTo = URL.ORDER_MODIFIED_STATUS_REQUEST_EVENT
        .replaceAll('ORDER_ID', orderId!);
    SocketService().getSocket().on(listenTo, (data) async {
      print('Update: $data');
      // if (data != null) {
      //   request = OrderSocketRequest.fromJson(data);
      //   if (request != null) {
      //     if (request.orderStatus == ORDER_STATUS.completed) {
      //       cleanCart(notifier);
      //     } else if (request.orderStatus == ORDER_STATUS.cancelled) {
      //       notifier.showScreen(CartScreen());
      //       customDialog(
      //         title: 'ORDER_IS_CANCELLED'.tr,
      //         okText: 'Ok',
      //         status: DIALOG_STATUS.WARNING,
      //       );
      //     } else if (request.orderStatus == ORDER_STATUS.confirmed) {
      //       getNotifiWaiter();
      //       notifier.showScreen(Home());
      //       customDialog(
      //         title: 'Order Confirmed',
      //         okText: 'Ok',
      //         status: DIALOG_STATUS.SUCCESS,
      //       );
      //       final res = await fetchOrderDetails();
      //       final printResult = await printerService.printReciept(
      //         type: PrinterRecieptType.KITCHEN,
      //         products: res?.cart ?? [],
      //       );
      //       if (printResult != null) {
      //         customDialog(
      //           title: printResult.tr,
      //           okText: 'Ok',
      //           status: DIALOG_STATUS.FAIL,
      //         );
      //       }
      //     }
      //   }
      // }
    });
  }

  cleanCart(notifier, {bool clearSocket = true}) async {
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
          title: 'Waiter Warned',
        );
      }
    });
  }
}
