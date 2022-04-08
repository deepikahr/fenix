import 'dart:async';

import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/models/api_response_models/payment_response/payment_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class QRScreen extends HookWidget {
  final PaymentResponse? paymentResponse;
  final OrderDetailsResponse? order;
  QRScreen(this.paymentResponse, this.order);
  @override
  Widget build(BuildContext context) {
    final notifier = useProvider(qrScreenProvider.notifier);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await notifier.checkPaymentStatus(
              paymentResponse, order, context.read(homeTabsProvider.notifier));
        });
      }
      return notifier.closeTimer;
    }, const []);
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('PAY_WITH_QR'.tr, style: textBlackLargeBM20(context)),
          SizedBox(height: 20),
          if (paymentResponse != null && paymentResponse?.qrCode != null)
            Image.network(
              paymentResponse!.qrCode!,
            ),
        ],
      ),
    );
  }
}
