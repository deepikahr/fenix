import 'dart:developer';
import 'dart:typed_data';

import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/cart_product/cart_product.dart';
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
import 'package:intl/intl.dart';

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
            // _logReceipt(
            //   products: order.cart,
            //   invoiceNo: order.orderID.toString(),
            //   paymentType: order.paymentType,
            //   totalAmount: order.grandTotal,
            // );

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
          } else {
            notifier.showScreen(OrderDetails());
          }
        }
      }
    });
  }

  void _logReceipt({
    required List<CartProduct> products,
    String? paymentType,
    String? invoiceNo,
    double? totalAmount,
  }) {
    log(db.getFranchiseName() ?? Constants.restaurantName,
        name: 'CustomerReciept');

    log((db.getRestaurantName() ?? Constants.restaurantName).tr,
        name: 'CustomerReciept');
    log('NIF: ${db.getNif() ?? 'N/A'}', name: 'CustomerReciept');
    final address = db.getAddress();
    if (address != null) {
      log(address, name: 'CustomerReciept');
    }
    final number = db.getContactNumber();
    if (number != null) {
      log(number, name: 'CustomerReciept');
    }

    log('${'INVOICE_NUMBER'.tr}: ${invoiceNo == null ? 'N/A' : invoiceNo}',
        name: 'CustomerReciept');
    final now = DateTime.now();
    final dateformatter = DateFormat('MM/dd/yyyy');
    final timeformatter = DateFormat('hh:mm');

    final String date = dateformatter.format(now);
    final String time = timeformatter.format(now);

    log('${'DATE'.tr}: $date     ${'TIME'.tr}: $time', name: 'CustomerReciept');
    log('CONCEPT'.tr + 'PRICE'.tr + 'AMOUNT'.tr, name: 'CustomerReciept');
    double totalPrice = 0.0;
    for (var i = 0; i < products.length; i++) {
      final productSize = products[i].variant?.sizeName;

      log(
          '${products[i].variantQuantity} ${products[i].productName} ${productSize != null ? '[$productSize]' : ''}' +
              '------------' +
              '${products[i].totalProductPrice.toStringAsFixed(2)}' +
              '---------------' +
              (products[i].totalProductPrice * products[i].variantQuantity)
                  .toStringAsFixed(2),
          name: 'CustomerReciept');
      totalPrice += products[i].totalProductPrice * products[i].variantQuantity;
    }

    log('TAX_BASE_PRINTER'.tr, name: 'CustomerReciept');

    log(
        '${'TOTAL'.tr}: ' +
            '---------------' +
            Uint8List.fromList([8364]).toString() +
            ' ${totalAmount == null || totalAmount == 0.0 ? totalPrice.toStringAsFixed(2) : totalAmount.toStringAsFixed(2)}',
        name: 'CustomerReciept');

    log('${'TABLE'.tr}: ${db.getTableNumber()}', name: 'CustomerReciept');
    log('${'WAY_TO_PAY'.tr}: ${paymentType == null ? 'N/A' : paymentType.tr}',
        name: 'CustomerReciept');
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
