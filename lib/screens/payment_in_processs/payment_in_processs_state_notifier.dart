import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/payment_request_completed_response/payment_request_completed_response.dart';
import 'package:fenix_user/network/printer.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/network/urls.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/order_details/order_details.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state_notifier.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class PaymentInProcessStateNotifier
    extends StateNotifier<PaymentInProcessState> {
  final ProviderReference ref;

  DB get db {
    return ref.read(dbProvider);
  }

  CartNotifier get cartState {
    return ref.read(cartProvider.notifier);
  }

  PrinterService get printerService {
    return ref.read(printerProvider);
  }

  OrderInProcessStateNotifier get socketProvider {
    return ref.read(orderInProcess.notifier);
  }

  PaymentInProcessStateNotifier(this.ref) : super(PaymentInProcessState());

  getPaymentStatus(
      OrderDetailsResponse? order, HomeTabsNotifier notifier) async {
    var request;
    SocketService().getSocket().clearListeners();
    var listenTo = URL.PAYMENT_REQUEST_EVENT.replaceAll('ORDER_ID', order!.id!);
    SocketService().getSocket().on(listenTo, (data) async {
      if (data != null) {
        request = PaymentRequestCompletedResponse.fromJson(data);
        if (request != null) {
          if (request.paymentStatus == PAYMENT_STATUS.completed) {
            await cleanCart(notifier);
            final printResult = await printerService.printReciept(
              type: PrinterRecieptType.CUSTOMER,
              products: order.cart,
              orderID: order.orderID,
              paymentType: order.paymentType,
              totalAmount: order.amountPaid,
            );
            print('paid amount: ${order.amountPaid}');
            if (printResult != null) {
              customDialog(
                title: printResult.tr,
                okText: 'Ok',
                status: DIALOG_STATUS.FAIL,
              );
            }
          } else {
            notifier.showScreen(OrderDetails());
          }
        }
      }
    });
  }

  cleanCart(HomeTabsNotifier notifier) async {
    await cartState.deleteCart();
    await db.removeOrderId();
    await db.removeOrderNumber();
    SocketService().getSocket().clearListeners();
    socketProvider.getNotifiWaiter();
    notifier.showScreen(Thankyou());
  }
}
