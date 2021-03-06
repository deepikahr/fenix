import 'dart:developer';

import 'package:fenix_user/common/kios_mode_utils.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/order_socket_response/order_socket_response.dart';
import 'package:fenix_user/models/api_response_models/update_order_history_response/update_order_history_model.dart';
import 'package:fenix_user/models/api_response_models/update_order_socket_response/update_order_socket_response.dart';
import 'package:fenix_user/network/api_service.dart';
import 'package:fenix_user/network/printer.dart';
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
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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
    final orderId = db.getOrderId();
    if (orderId != null) {
      final res = await api.orderDetails(orderId);
      if (res != null) {
        db.saveOrderNumber(res.orderID);
        if (mounted) state = state.copyWith.call(isLoading: false);
        return res;
      }
    }
    if (mounted) state = state.copyWith.call(isLoading: false);
  }

  Future<List<UpdateOrderHistoryModel>?> fetchmodificationHistory() async {
    final orderId = db.getOrderId();
    if (orderId != null) {
      final res = await api.getModificationOrderHistory(orderId);
      return res;
    }
    return [];
  }

  getOrderStatus(String? orderId, HomeTabsNotifier notifier,
      {bool isPickUpProduct = false}) async {
    if (orderId != null) {
      var request;
      SocketService().getSocket().clearListeners();
      var listenTo =
          URL.ORDER_STATUS_REQUEST_EVENT.replaceAll('ORDER_ID', orderId);
      SocketService().getSocket().on(listenTo, (data) async {
        if (data != null) {
          request = OrderSocketRequest.fromJson(data);
          if (request != null) {
            if (request.orderStatus == ORDER_STATUS.completed) {
              cleanCart(notifier);
            } else if (request.orderStatus == ORDER_STATUS.cancelled) {
              await db.removeOrderId();
              await db.removeOrderNumber();
              notifier.showScreen(CartScreen());
              customDialog(
                title: 'ORDER_IS_CANCELLED'.tr,
                okText: 'OK'.tr,
                status: DIALOG_STATUS.WARNING,
              );
            } else if (request.orderStatus == ORDER_STATUS.confirmed) {
              DB().setIsOrderPending(false);
              final res = await fetchOrderDetails();
              try {
                final printResult = await printerService.printReciept(
                  type: PrinterRecieptType.KITCHEN,
                  orderID: db.getOrderNumber(),
                  products: res?.cart ?? [],
                );
                if (printResult != null) {
                  customDialog(
                    title: printResult.tr,
                    okText: 'OK'.tr,
                    status: DIALOG_STATUS.FAIL,
                  );
                }
              } catch (e) {
                if (kReleaseMode) {
                  Sentry.captureException(
                    Exception(
                      'Cannot connet to printer --> $e',
                    ),
                  );
                }
                customDialog(
                  title: 'CONNECT_ERROR_PRINTER'.tr,
                  okText: 'OK'.tr,
                  status: DIALOG_STATUS.FAIL,
                );
              }
              if (isPickUpProduct) {
                cleanCart(notifier);
              } else {
                getNotifiWaiter();
                if (isNormalFlowInKioskMode) {
                  notifier.showScreen(Home());
                  customDialog(
                    title: 'ORDER_CONFIRMED'.tr,
                    okText: 'OK'.tr,
                    status: DIALOG_STATUS.SUCCESS,
                  );
                } else {
                  notifier.showScreen(OrderDetails());
                }
              }
            }
          }
        }
      });
    }
  }

  getUpdateOrderStatus(String? orderId, HomeTabsNotifier notifier) {
    if (orderId != null) {
      late UpdateOrderSocketResponse request;
      SocketService().getSocket().clearListeners();
      var listenTo = URL.ORDER_MODIFIED_STATUS_REQUEST_EVENT
          .replaceAll('ORDER_ID', orderId);
      SocketService().getSocket().clearListeners();
      SocketService().getSocket().on(listenTo, (data) async {
        if (data != null) {
          request = UpdateOrderSocketResponse.fromJson(data);
          await cartState.updateCart(request.localCart);
          notifier.showScreen(Home());
          DB().setIsOrderPending(false);
          if (request.action == ACTION_MODIFICATION.reject) {
            customDialog(
              title: 'ORDER_IS_CANCELLED'.tr,
              okText: 'OK'.tr,
              status: DIALOG_STATUS.WARNING,
            );
          } else {
            final modificationHistory = await fetchmodificationHistory();
            // _logKitchenReceipt(modificationHistory);
            try {
              final printResult = await printerService.printReciept(
                type: PrinterRecieptType.KITCHEN,
                //we are reversing it because we get it in a descending order of created time, i.e latest first
                // for printing we need it in the older first order hence reversed
                modificationHistory:
                    modificationHistory?.reversed.toList() ?? [],
                orderID: db.getOrderNumber(),
              );
              if (printResult != null) {
                customDialog(
                  title: printResult.tr,
                  okText: 'OK'.tr,
                  status: DIALOG_STATUS.FAIL,
                );
              }
            } catch (e) {
              if (kReleaseMode) {
                Sentry.captureException(
                  Exception(
                    'Cannot connet to printer --> $e',
                  ),
                );
              }
              customDialog(
                title: 'CONNECT_ERROR_PRINTER'.tr,
                okText: 'OK'.tr,
                status: DIALOG_STATUS.FAIL,
              );
            }
            customDialog(
              title: 'ORDER_CONFIRMED'.tr,
              okText: 'OK'.tr,
              status: DIALOG_STATUS.SUCCESS,
            );
          }
        }
      });
    }
  }

  void _logKitchenReceipt(List<UpdateOrderHistoryModel>? modificationHistory) {
    final someList = modificationHistory?.reversed.toList() ?? [];
    for (var i = 0; i < someList.length; i++) {
      if (someList[i].action == ACTION_MODIFICATION.accept) {
        final products = someList[i].localCart?.products ?? [];

        for (var i = 0; i < products.length; i++) {
          if (products[i].modified) {
            final productSize = products[i].variant?.sizeName;
            log('-------------' +
                '${(products[i].productName ?? '') + (productSize != null ? '[$productSize]' : '') + ' (${products[i].variantQuantity < 1 ? 'NEW' : 'QUANTITY'})'}' +
                '  ${'${products[i].modifiedQuantity}'}');

            if (products[i].selectedAddOnItems.isNotEmpty) {
              log('------------' + 'Extras:');

              for (var j = 0; j < products[i].selectedAddOnItems.length; j++) {
                log(
                  '------------ ${products[i].selectedAddOnItems[j].addOnItemName}(${products[i].selectedAddOnItems[j].quantity})',
                );
              }
            }
            if (products[i].productInstructions != null &&
                products[i].productInstructions!.isNotEmpty)
              log(
                '-------------- ${'INSTRUCTIONS'.tr} -> ${products[i].productInstructions!}',
              );
          }
        }
      }
    }
  }

  cleanCart(notifier, {bool clearSocket = true}) async {
    await cartState.deleteCart();
    await db.removeOrderId();
    await db.removeOrderNumber();
    SocketService().getSocket().clearListeners();
    getNotifiWaiter();
    notifier.showScreen(Thankyou());
  }

  void getNotifiWaiter() async {
    final userId = db.getId();
    if (userId != null) {
      var listenTo =
          URL.NOTIFI_WAITER_REQUEST_EVENT.replaceAll('USER_ID', userId);
      SocketService().getSocket().on(listenTo, (data) async {
        if (data != null) {
          customDialog(
            status: DIALOG_STATUS.SUCCESS,
            title: 'WAITER_WARNED'.tr,
          );
        }
      });
    }
  }
}
