import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class Payment extends HookWidget {
  final OrderDetailsResponse? order;
  Payment(this.order);
  @override
  Widget build(BuildContext context) {
    final state = useProvider(paymentScreenProvider);
    final notifier = useProvider(paymentScreenProvider.notifier);

    return Container(
      color: light,
      child: ListView(
        children: [
          SizedBox(height: 80),
          custombuttonsmFW(
            context,
            'PAY_IN_CASH'.tr,
            () async {
              if (!state.isLoading && state.buttonName == null) {
                final res = await notifier.requestPayment(
                  order,
                  PAYMENT_TPES.payInCash,
                );
                if (res != null) {
                  context
                      .read(homeTabsProvider.notifier)
                      .showScreen(PaymentInProcess(order));
                }
              }
            },
            state.isLoading && state.buttonName == PAYMENT_TPES.payInCash
                ? true
                : false,
          ),
          SizedBox(height: 40),
          custombuttonsmFW(
            context,
            'PAY_WITH_CARD'.tr,
            () async {
              if (!state.isLoading && state.buttonName == null) {
                final res = await notifier.requestPayment(
                  order,
                  PAYMENT_TPES.payWithCard,
                );
                if (res != null) {
                  context
                      .read(homeTabsProvider.notifier)
                      .showScreen(PaymentInProcess(order));
                }
              }
            },
            state.isLoading && state.buttonName == PAYMENT_TPES.payWithCard
                ? true
                : false,
          ),
          SizedBox(height: 40),
          custombuttonsmFW(
            context,
            'NFC'.tr,
            () {},
            state.isLoading && state.buttonName == PAYMENT_TPES.nfc
                ? true
                : false,
          ),
        ],
      ),
    );
  }
}
