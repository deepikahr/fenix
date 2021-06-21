import 'package:flutter/material.dart';
import 'package:restaurant_saas/screens/payment/ThankYou/thankYou.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AddCard extends HookWidget {
  bool _checkbox = false;

  final cardNumberFocusNode = FocusNode();
  final cardNameFocusNode = FocusNode();
  final cvvFocusNode = FocusNode();
  final validThroughFocusNode = FocusNode();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final cardNumberTextFieldController = useTextEditingController();
    final cardNameTextFieldController = useTextEditingController();
    final cvvTextFieldController = useTextEditingController();
    final validThroughTextFieldController = useTextEditingController();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'ADD_NEW_CARD'.tr),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(
            height: 6,
          ),
          blockTextField(
            context,
            cardNumberTextField(
                context, cardNumberTextFieldController, cardNumberFocusNode,
                (value) {
              FocusScope.of(context).requestFocus(cardNumberFocusNode);
            }),
          ),
          SizedBox(
            height: 26,
          ),
          blockTextField(
            context,
            cardNameTextField(
                context, cardNameTextFieldController, cardNameFocusNode,
                (value) {
              FocusScope.of(context).requestFocus(cardNameFocusNode);
            }),
          ),
          SizedBox(
            height: 26,
          ),
          Row(
            children: [
              Expanded(
                child: blockTextField(
                  context,
                  validTextField(context, validThroughTextFieldController,
                      validThroughFocusNode, (value) {
                    FocusScope.of(context).requestFocus(validThroughFocusNode);
                  }),
                ),
              ),
              SizedBox(
                width: 16,
              ),
              Expanded(
                child: blockTextField(
                  context,
                  cvvTextField(context, cvvTextFieldController, cvvFocusNode,
                      (value) {
                    FocusScope.of(context).requestFocus(cvvFocusNode);
                  }),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            children: [
              Checkbox(
                value: _checkbox,
                activeColor: green,
                onChanged: (value) {
                  _checkbox = true;
                },
              ),
              titleTextDarkLightSmallBM(
                  context, 'SAVE_CARD_DETAILS_SECURELY'.tr)
            ],
          ),
          SizedBox(
            height: 26,
          ),
          primaryButton(context, 'SUBMIT'.tr, () {
            Get.to(() => ThankYou());
          }),
        ],
      ),
    );
  }

  Widget cardNumberTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      decoration: InputDecoration(
        labelText: 'CARD_NUMBER'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget cardNameTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      decoration: InputDecoration(
        labelText: 'NAME_ON_CARD'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget cvvTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      decoration: InputDecoration(
        labelText: 'CVV'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }

  Widget validTextField(
    BuildContext context,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      keyboardType: TextInputType.text,
      onChanged: (String value) {},
      decoration: InputDecoration(
        labelText: 'VALID_THROUGH'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
