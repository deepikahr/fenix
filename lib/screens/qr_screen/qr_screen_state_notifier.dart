import 'dart:async';

import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/payment_response/payment_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/printer.dart';
import 'package:fenix_user/network/socket.dart';
import 'package:fenix_user/providers/cart_notifier.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home_tabs/home_tabs_notifier.dart';
import 'package:fenix_user/screens/order_in_processs/order_in_process_state_notifier.dart';
import 'package:fenix_user/screens/qr_screen/qr_screen_state.dart';
import 'package:fenix_user/screens/thankyou/thankyou_screen.dart';
import 'package:fenix_user/widgets/alertBox.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QRScreenStateNotifier extends StateNotifier<QRScreenState> {
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

  PrinterService get printerService {
    return ref.read(printerProvider);
  }

  OrderInProcessStateNotifier get socketProvider {
    return ref.read(orderInProcess.notifier);
  }

  late Timer _timer;
  QRScreenStateNotifier(this.ref) : super(QRScreenState());
  Future checkPaymentStatus(PaymentResponse? paymentResponse,
      OrderDetailsResponse? order, HomeTabsNotifier notifier) async {
    checkPaymentStatusApi(paymentResponse, order, notifier);
    _timer = Timer.periodic(Duration(seconds: 5), (timer) async {
      print('object ${_timer.isActive}');
      checkPaymentStatusApi(paymentResponse, order, notifier);
    });
  }

  checkPaymentStatusApi(PaymentResponse? paymentResponse,
      OrderDetailsResponse? order, HomeTabsNotifier notifier) async {
    final res = await api.paymentStatus(paymentResponse?.id);
    print(res);
    if (res?.paymentStatus == PAYMENT_STATUS.completed) {
      if (order != null) {
        await cleanCart(notifier);
        final printResult = await printerService.printReciept(
          type: PrinterRecieptType.CUSTOMER,
          products: order.cart,
          orderID: order.orderID,
          paymentType: order.paymentType,
          totalAmount: order.grandTotal,
        );
        if (printResult != null) {
          customDialog(
            title: printResult.tr,
            okText: 'Ok',
            status: DIALOG_STATUS.FAIL,
          );
        }
      }
    } else {
      Get.back();
      Get.back();
    }
  }

  cleanCart(HomeTabsNotifier notifier) async {
    await cartState.deleteCart();
    await db.removeOrderId();
    await db.removeOrderNumber();
    SocketService().getSocket().clearListeners();
    socketProvider.getNotifiWaiter();
    notifier.showScreen(Thankyou());
  }

  closeTimer() {
    print('close');
    if (_timer.isActive) {
      _timer.cancel();
    }
  }
}
