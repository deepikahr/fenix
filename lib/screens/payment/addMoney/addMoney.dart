import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:get/get.dart';

class AddMoney extends HookWidget {
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final state = useProvider(addMoneyProvider);
    final addMoneyTextFieldController = useTextEditingController();
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(addMoneyProvider.notifier).findCurrency();
        });
      }
      return;
    }, const []);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'ADD_MONEY'.tr),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 35),
                blockTextFieldForm(
                  context,
                  addMoneyTextField(
                      context, formKey, addMoneyTextFieldController, focusNode,
                      (value) {
                    FocusScope.of(context).unfocus();
                    formKey.currentState!.validate();
                  }, state),
                ),
                SizedBox(height: 35),
                primaryBlockButton(
                  context,
                  'ADD_MONEY'.tr,
                  () async {
                    if (addMoneyTextFieldController.text.isNotEmpty) {
                      final paymentIntent = await context
                          .read(addMoneyProvider.notifier)
                          .addMoney(
                              double.parse(addMoneyTextFieldController.text));

                      switch (paymentIntent?.status ?? '') {
                        case 'succeeded':
                          await customDialog(
                            title: 'MONEY_ADDED_SUCCESSFULLY'.tr,
                          );

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
                    } else {
                      await customDialog(
                          status: DIALOG_STATUS.WARNING,
                          title: 'PLEASE_ENTER_THE_AMOUNT'.tr);
                    }
                  },
                ),
              ],
            ),
          ),
          if (state.isLoading) Container(color: Colors.white, child: GFLoader())
        ],
      ),
    );
  }

  Widget addMoneyTextField(
    BuildContext context,
    GlobalKey<FormFieldState> key,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
    state,
  ) {
    return TextFormField(
      key: key,
      controller: controller,
      keyboardType: TextInputType.text,
      onFieldSubmitted: onFieldSubmitted,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 20, top: 11),
          child: Text(
            '${state.currencySymbol}:',
            style: textblackXLBB(context),
          ),
        ),
        hintText: '00.00',
        labelStyle: textDarkLightSmallBR(context),
        border: InputBorder.none,
      ),
    );
  }
}
