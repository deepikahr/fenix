import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';

class WalletDialog extends HookWidget {
  final double walletAmount;
  final double orderAmount;
  final Function okListener;
  final String okText;

  WalletDialog(
      this.walletAmount, this.orderAmount, this.okListener, this.okText);

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final GlobalKey<FormFieldState>? formKey = GlobalKey<FormFieldState>();

    final state = useProvider(walletDialogProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          if (orderAmount <= walletAmount) {
            amountController.text = orderAmount.toString();
          } else {
            amountController.text = walletAmount.toString();
          }
          context
              .read(walletDialogProvider.notifier)
              .calculateAmount(orderAmount, walletAmount);
        });
      }
      return;
    }, const []);

    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              '${'YOUR_WALLET_AMOUNT_WAS'.tr} ${state.currencySymbol}${walletAmount.toStringAsFixed(2)}',
              style: textPrimaryLargeBM(context),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.number,
                key: formKey,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
                ],
                onFieldSubmitted: (value) {
                  if (formKey?.currentState?.validate() ?? false) {
                    context
                        .read(walletDialogProvider.notifier)
                        .calculateAmount(orderAmount, double.parse(value));
                  }
                },
                validator: (value) => validateAmount(value,
                    maxLimit: (orderAmount < (walletAmount)
                        ? orderAmount
                        : walletAmount)),
                controller: amountController,
                decoration: InputDecoration(
                    labelStyle: textBlackSmallBM(context),
                    hintStyle: textBlackSmallBM(context),
                    labelText: 'ENTER_AMOUNT'.tr,
                    hintText: 'ENTER_AMOUNT'.tr),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if (state.showAmountNeedToPay)
                    Text(
                      '${'REMAINING_AMOUNT'.tr} ${state.currencySymbol}${state.remainingAmountNeedToPay} ${'YOU_NEED_PAY_THROUGH_CASH_CARD'.tr}',
                      style: textBlackSmallBM(context),
                    ),
                  if (state.showWalletDesc)
                    Text(
                      '${'YOUR_REMAINING_WALLET_BALANCE'.tr} ${state.currencySymbol}${state.remainingWalletBalance.toStringAsFixed(2)}',
                      style: textBlackSmallBM(context),
                    ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: primary,
                  type: GFButtonType.outline,
                  onPressed: () {
                    if (formKey?.currentState?.validate() ?? false) {
                      okListener(amountController.text);
                      Get.back();
                    }
                  },
                  child: Text(
                    okText,
                    style: textPrimarySmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: GFColors.DARK,
                  type: GFButtonType.outline,
                  onPressed: () => Get.back(),
                  child: Text(
                    'CANCEL'.tr,
                    style: textBlackSmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
