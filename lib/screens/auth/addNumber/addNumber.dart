import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/network/api_helper.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/auth/verifyNumber/verifyNumber.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:get/get.dart';

class AddNumber extends HookWidget {
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();
  final GlobalKey<FormFieldState> enterReferralCodFormKey =
      GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    final numberTextFieldController = useTextEditingController();
    final referralTextFieldController = useTextEditingController();

    final state = useProvider(addNumberProvider);
    useEffect(() {
      Future.delayed(Duration.zero, () {
        numberTextFieldController.text =
            Constants.predefined == 'true' ? '9999999999' : '';
        context.read(addNumberProvider.notifier).fetchReferralCode();
      });
      return;
    }, const []);
    return Scaffold(
      appBar: introAppbar(context),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.topStart,
                  children: [
                    Image.asset(
                      'lib/assets/images/bg1.png',
                      height: screenHeight(context) * 0.5,
                      width: screenWidth(context),
                      fit: BoxFit.fill,
                    ),
                    state.isGetReferralLoading
                        ? Column(
                            children: [
                              SizedBox(height: 10),
                              Center(child: GFLoader()),
                            ],
                          )
                        : Padding(
                            padding: const EdgeInsets.all(32.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                titleTextDarkXXLargeBM(context, 'ADD_PHONE'.tr),
                                SizedBox(
                                  height: 12,
                                ),
                                titleTextDarkSmallBR(
                                    context, 'PLEASE_ENTER_PHONE'.tr),
                                SizedBox(
                                  height: 66,
                                ),
                                customNumberTextField(
                                    context,
                                    Image.asset(
                                      'lib/assets/icons/phone.png',
                                      scale: 3,
                                    ),
                                    numberTextField(
                                        context,
                                        formKey,
                                        numberTextFieldController,
                                        focusNode, (value) {
                                      FocusScope.of(context).unfocus();
                                      formKey.currentState!.validate();
                                    }), (country) {
                                  context
                                      .read(addNumberProvider.notifier)
                                      .setCountryCode(country.dialCode!);
                                }),
                                SizedBox(
                                  height: 46,
                                ),
                                primaryButton(context, 'SUBMIT'.tr, () async {
                                  if (formKey.currentState!.validate()) {
                                    int? responseCode;
                                    final response = await context
                                        .read(addNumberProvider.notifier)
                                        .submit(
                                      numberTextFieldController.text,
                                      state.countryCode,
                                      referralTextFieldController.text,
                                      (value) {
                                        responseCode = value;
                                      },
                                    );
                                    if (response != null) {
                                      if (responseCode == StatusCode.CREATED) {
                                        db.saveAddressValue(false);
                                        db.saveUserValue(false);
                                      }
                                      await Get.to(() => VerifyNumber(
                                            numberTextFieldController.text,
                                            state.countryCode,
                                            response.sId,
                                            responseCode,
                                            referralTextFieldController.text,
                                          ));
                                    }
                                  }
                                }),
                                flatDarkButton(context, 'HAVE_REFERAL_CODE'.tr,
                                    () {
                                  referralTextFieldController.text = '';
                                  showDialog(
                                      context: context,
                                      builder: (context) => referralCode(
                                          context,
                                          referralTextFieldController));
                                }),
                              ],
                            ),
                          ),
                  ],
                ),
                // SizedBox(
                //   height: 26,
                // ),
                // titleTextDarkLight2SmallBR(context, 'or'.tr),
                // SizedBox(
                //   height: 26,
                // ),
                // outlineBlockSocialButton(
                //     context,
                //     'lib/assets/icons/facebook.png',
                //     'CONTINUE_WITH_FACEBOOK'.tr, () async {
                //   final res = await context
                //       .read(addNumberProvider.notifier)
                //       .facebookSignIn();
                //   if (res != null) {
                //     await Get.to(() => PickLocation());
                //   }
                // }),
                // SizedBox(
                //   height: 16,
                // ),
                // outlineBlockSocialButton(
                //     context,
                //     'lib/assets/icons/twitter.png',
                //     'CONTINUE_WITH_TWITTER'.tr, () {
                //   Get.to(() => PickLocation());
                // }),
                // SizedBox(
                //   height: 16,
                // ),
                // outlineBlockSocialButton(context, 'lib/assets/icons/gmail.png',
                //     'CONTINUE_WITH_G_MAIL'.tr, () async {
                //   final res = await context
                //       .read(addNumberProvider.notifier)
                //       .googleSignIn();
                //   if (res != null) {
                //     await Get.to(() => PickLocation());
                //   }
                // }),
              ],
            ),
          ),
          if (state.isLoading) Center(child: GFLoader()),
        ],
      ),
    );
  }

  Widget referralCode(context, controller) {
    return Dialog(
        child: Stack(alignment: AlignmentDirectional.topStart, children: [
      Image.asset(
        'lib/assets/images/bg1.png',
        fit: BoxFit.fill,
        height: 190,
        width: screenWidth(context),
      ),
      Container(
        height: 190,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              '${'REFERRAL_CODE'.tr}',
              style: textBlackLargeBM(context),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                keyboardType: TextInputType.text,
                key: enterReferralCodFormKey,
                onFieldSubmitted: (value) {
                  controller.text = value;
                },
                controller: controller,
                decoration: InputDecoration(
                  labelStyle: textBlackSmallBM(context),
                  hintStyle: textBlackSmallBM(context),
                  labelText: 'REFERRAL_CODE'.tr,
                  hintText: 'REFERRAL_CODE'.tr,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: primary,
                  type: GFButtonType.outline,
                  onPressed: () => Get.back(),
                  child: Text(
                    'SUBMIT'.tr,
                    style: textPrimarySmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
                SizedBox(width: 10),
                Expanded(
                    child: GFButton(
                  blockButton: true,
                  size: GFSize.LARGE,
                  color: GFColors.DARK,
                  type: GFButtonType.outline,
                  onPressed: () {
                    controller.text = '';
                    Get.back();
                  },
                  child: Text(
                    'CANCEL'.tr,
                    style: textBlackSmallBM(context),
                    textAlign: TextAlign.center,
                  ),
                )),
              ],
            )
          ],
        ),
      )
    ]));
  }

  Widget numberTextField(
    BuildContext context,
    GlobalKey<FormFieldState> key,
    controller,
    FocusNode focusNode,
    ValueChanged<String> onFieldSubmitted,
  ) {
    return TextFormField(
      key: key,
      keyboardType: TextInputType.phone,
      controller: controller,
      validator: validateMobile,
      focusNode: focusNode,
      onFieldSubmitted: onFieldSubmitted,
      decoration: InputDecoration(
        labelText: 'PHONE_NUMBER'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        border: InputBorder.none,
      ),
    );
  }
}
