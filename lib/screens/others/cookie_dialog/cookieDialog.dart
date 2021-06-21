import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';

class CookieDialog extends HookWidget {
  final double loyaltyPoint;
  final double loyaltyMonetaryValue;
  final Function okListener;

  CookieDialog(this.loyaltyPoint, this.loyaltyMonetaryValue, this.okListener);

  @override
  Widget build(BuildContext context) {
    final amountController = useTextEditingController();
    final GlobalKey<FormFieldState>? formKey = GlobalKey<FormFieldState>();

    final state = useProvider(cookieDialogProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          amountController.text = loyaltyPoint.toString();
          context.read(cookieDialogProvider.notifier).calculateEstimatedAmount(
              loyaltyPoint.toString(), loyaltyMonetaryValue);
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
              '${'YOU_HAVE'.tr} $loyaltyPoint ${'COOKIE_POINT'.tr}',
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
                  context
                      .read(cookieDialogProvider.notifier)
                      .calculateEstimatedAmount(value, loyaltyMonetaryValue);
                },
                validator: (value) =>
                    validateAmount(value, maxLimit: loyaltyPoint.toDouble()),
                controller: amountController,
                decoration: InputDecoration(
                  labelStyle: textBlackSmallBM(context),
                  hintStyle: textBlackSmallBM(context),
                  labelText: 'ENTER_AMOUNT'.tr,
                  hintText: 'ENTER_AMOUNT'.tr,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              '${'YOU_CAN_CLAIM'.tr} ${state.calculatedAmount}',
              style: textBlackSmallBM(context),
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
                      Get.back();
                      okListener(amountController.text);
                    }
                  },
                  child: Text(
                    'CONVERT_TO_WALLET'.tr,
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
