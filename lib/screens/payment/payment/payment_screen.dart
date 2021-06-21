import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/models/api_request_models/cart/cart.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/payment/ThankYou/thankYou.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/screens/others/wallet_dialog/walletDialog.dart';
import 'package:restaurant_saas/screens/payment/payment/paymentShimmer.dart';

class PaymentScreen extends HookWidget {
  final Cart cart;

  PaymentScreen(this.cart);

  @override
  Widget build(BuildContext context) {
    final state = useProvider(paymentScreenProvider);
    final notifier = useProvider(paymentScreenProvider.notifier);

    final walletDescription = state.usedWalletAmount != 0 &&
            state.usedWalletAmount < cart.grandTotal
        ? '${'USING'.tr} ${state.isLoading ? '' : state.currencySymbol}${state.usedWalletAmount} ${'FROM_WALLET'.tr}'
        : null;

    final cardDescription = state.usedWalletAmount != 0 &&
            state.usedWalletAmount < cart.grandTotal
        ? '${'PAY_REMAINING'.tr} ${state.isLoading ? '' : state.currencySymbol}${cart.grandTotal - state.usedWalletAmount} ${'USING_CARD'.tr}'
        : null;

    final cashDescription = state.usedWalletAmount != 0 &&
            state.usedWalletAmount < cart.grandTotal
        ? '${'PAY_REMAINING'.tr} ${state.isLoading ? '' : state.currencySymbol}${cart.grandTotal - state.usedWalletAmount} ${'WITH_CASH_ON_DELIVERY'.tr}'
        : null;

    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          notifier.fetchAmount();
        });
      }
    }, const []);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'PAYMENT'.tr),
      body: Stack(
        children: [
          ListView(
            children: [
              infoBlock(context, state),
              greyBgTitleBlock(context, 'WALLET'.tr),
              iconListTile(
                context,
                'lib/assets/icons/wallet.png',
                'RESTAURANT_SAAS_WALLET'.tr,
                () {
                  showDialog(
                    context: context,
                    builder: (context) => WalletDialog(
                      state.totalWalletAmount,
                      cart.grandTotal,
                      (amountString) async {
                        if (amountString != null) {
                          final amount = double.parse(amountString);
                          if (amount == cart.grandTotal) {
                            final res = await notifier.walletPayment(cart);
                            await notifier.clearCart();
                            if (res != null) {
                              await Get.to(ThankYou());
                              await Get.offAll(HomeTabs());
                            }
                          } else if (amount < cart.grandTotal) {
                            notifier.setUsedWalletAmount(amount);
                          }
                        }
                      },
                      'PAY'.tr,
                    ),
                  );
                },
                description: walletDescription,
              ),
              greyBgTitleBlock(context, 'CREDIT_OR_DEBIT'.tr),
              iconListTile(
                context,
                'lib/assets/icons/wallet.png',
                'PAY_WITH_CARD'.tr,
                () async {
                  final res = await notifier.cardPayment(cart);
                  await notifier.clearCart();
                  switch (res?.status ?? '') {
                    case 'succeeded':
                      await Get.to(ThankYou());
                      await Get.offAll(HomeTabs());
                      break;
                    case 'requires_payment_method':
                      await customDialog(
                        status: DIALOG_STATUS.FAIL,
                        title: 'PLEASE_TRY_AGAIN'.tr,
                      );
                      break;
                    case 'processing':
                      await customDialog(
                        status: DIALOG_STATUS.WARNING,
                        title: 'PLEASE_CHECK_AFTER_FEW_MINUTES'.tr,
                      );
                      break;
                    case 'canceled':
                      await customDialog(
                        status: DIALOG_STATUS.FAIL,
                        title: 'PAYMENT_DECLINED'.tr,
                      );
                      break;
                  }
                },
                description: cardDescription,
              ),
              greyBgTitleBlock(context, 'PAY_ON_DELIVERY'.tr),
              iconListTile(
                context,
                'lib/assets/icons/dollar.png',
                'Cash',
                () async {
                  final res = await notifier.cashOnDelivery(cart);
                  await notifier.clearCart();
                  if (res != null) {
                    await Get.to(ThankYou());
                    await Get.offAll(HomeTabs());
                  }
                },
                description: cashDescription,
              ),
            ],
          ),
          if (state.isLoading)
            Container(color: Colors.white, child: paymentWallet())
        ],
      ),
    );
  }

  Widget infoBlock(context, state) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                'lib/assets/icons/location.png',
                scale: 3,
              ),
              SizedBox(width: 8),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  titleTextDarkRegularBR(context, '${cart.restaurantName}'),
                  titleTextDarkLightXSmallBL(context, '${cart.franchiseName}')
                ],
              ),
            ],
          ),
          dualText(context, '${'BILL_TOTAL'.tr} : ',
              '${state.currencySymbol} ${cart.grandTotal}')
        ],
      ),
    );
  }
}
