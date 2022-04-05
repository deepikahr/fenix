import 'dart:developer';
import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/models/api_request_models/payment_request/payment_request.dart';
import 'package:fenix_user/models/api_response_models/order_details_response/order_details_response.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/payment_in_processs/payment_in_processs.dart';
import 'package:fenix_user/screens/qr_screen/qr_screen.dart';
import 'package:fenix_user/screens/tip_waiter/tip_waiter_state.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twemoji/twemoji.dart';
import 'tip_waiter_state_notifier.dart';

class TipWaiter extends HookWidget {
  final OrderDetailsResponse? order;
  final String? paymentType;
  TipWaiter({required this.order, required this.paymentType});
  @override
  Widget build(BuildContext context) {
    final state = useProvider(tipWaiterProvider);
    final notifier = useProvider(tipWaiterProvider.notifier);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 12, right: 12),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: grey2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'DO_YOU_WANT_TO_ADD_TIP'.tr.toUpperCase(),
              style: textBlackLargeBM(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            ListView.builder(
              physics: ScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: Constants.tipAmountList.length,
              itemBuilder: (BuildContext context, int index) {
                return tipAmountTile(
                  context,
                  Constants.tipAmountList,
                  Constants.tipAmountEmojiList,
                  index,
                  state,
                  notifier,
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget tipAmountTile(BuildContext context, List tipAmountList, List emojis,
      int index, TipWaiterState state, TipWaiterStateNotifier notifier) {
    final amount = (tipAmountList[index] == 0)
        ? 'NO_THANKS'.tr.toUpperCase()
        : "${tipAmountList[index]} ${Constants.currency}";
    return InkWell(
      onTap: () async {
        double tipAmount = tipAmountList[index] is int
            ? double.parse('${tipAmountList[index]}')
            : tipAmountList[index];
        final res = await notifier.requestPayment(
          order?.copyWith(tipAmount: tipAmount),
          paymentType == 'PAY_WITH_QR'
              ? PAYMENT_TYPE.payWithQR
              : paymentType == 'PAY_WITH_DATAPHONE'
                  ? PAYMENT_TYPE.payWithCard
                  : PAYMENT_TYPE.payInCash,
          index,
        );
        if (res != null) {
          log('message--${res}');
          if (paymentType == 'PAY_WITH_QR') {
            context
                .read(homeTabsProvider.notifier)
                .showScreen(QRScreen(res, order));
          } else {
            context
                .read(homeTabsProvider.notifier)
                .showScreen(PaymentInProcess(order));
          }
        }
      },
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: red,
              border: Border.all(color: buttonBorder),
            ),
            child: Center(
              child: state.isLoading && state.tipIndex == index
                  ? GFLoader(type: GFLoaderType.ios)
                  : tipAmountList[index] == 0
                      ? Text(
                          amount,
                          style: textWhiteRegularBM(),
                          textAlign: TextAlign.center,
                        )
                      : Row(
                          children: [
                            Text(
                              amount,
                              style: textWhiteRegularBM(),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
            ),
          ),
          Positioned(
            right: 100,
            child: Twemoji(
              emoji: '${emojis[index]}',
              height: 50,
              width: 50,
            ),
          ),
        ],
      ),
    );
  }
}
