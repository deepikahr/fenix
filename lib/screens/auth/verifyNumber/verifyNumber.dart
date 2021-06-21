import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/components/loader/gf_loader.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:restaurant_saas/common/utils.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/network/api_helper.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/auth/userInfo/userInfo.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:restaurant_saas/widgets/textFields.dart';
import 'package:get/get.dart';

final db = DB();

class VerifyNumber extends HookWidget {
  final focusNode = FocusNode();
  final GlobalKey<FormFieldState> formKey = GlobalKey<FormFieldState>();

  final String mobileNumber, countryCode, referralCode;
  final String? sId;
  final responseCode;

  VerifyNumber(this.mobileNumber, this.countryCode, this.sId, this.responseCode,
      this.referralCode);

  @override
  Widget build(BuildContext context) {
    final otpEditController = useTextEditingController();
    final state = useProvider(verifyNumberProvider);
    useEffect(() {
      Future.delayed(Duration.zero, () {
        otpEditController.text = Constants.predefined == 'true' ? '999999' : '';
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
                    Padding(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          titleTextDarkXXLargeBM(context, 'VERIFICATION'.tr),
                          SizedBox(
                            height: 12,
                          ),
                          titleTextDarkSmallBR(
                            context,
                            'PLEASE_ENTER_OTP'.tr,
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          regularTextField(
                            context,
                            otpTextField(
                              context,
                              formKey,
                              otpEditController,
                              focusNode,
                              (value) {
                                FocusScope.of(context).unfocus();
                                formKey.currentState!.validate();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 26,
                          ),
                          flatDarkButton(context, 'RESEND_OTP'.tr, () {
                            context
                                .read(verifyNumberProvider.notifier)
                                .resendOtp(
                                    mobileNumber, countryCode, referralCode);
                          }),
                          SizedBox(
                            height: 16,
                          ),
                          primaryButton(context, 'SUBMIT'.tr, () async {
                            final res = await context
                                .read(verifyNumberProvider.notifier)
                                .submit(
                                    mobileNumber, otpEditController.text, sId);

                            if (res != null) {
                              Timer(Duration(seconds: 2), () {
                                if (responseCode == StatusCode.CREATED) {
                                  var userInfoFillOrNot = db.getUserValue();
                                  var addressInfoFillOrNoy =
                                      db.getAddressValue();
                                  if (userInfoFillOrNot == true &&
                                      addressInfoFillOrNoy == true) {
                                    Get.offAll(() => HomeTabs());
                                  } else if (userInfoFillOrNot == true &&
                                      addressInfoFillOrNoy != true) {
                                    Get.offAll(() => PickLocation());
                                  } else if (userInfoFillOrNot != true &&
                                      addressInfoFillOrNoy == true) {
                                    Get.offAll(() => UserInfo());
                                  } else {
                                    Get.offAll(() => UserInfo());
                                  }
                                } else {
                                  db.saveAddressValue(true);
                                  db.saveUserValue(true);
                                  Get.offAll(() => HomeTabs());
                                }
                              });

                              await showDialog(
                                barrierColor: secondary,
                                context: context,
                                builder: (BuildContext context) {
                                  return blackAlertBox(
                                      context,
                                      'PHONE_VERIFIED_SUCCESSFULLY'.tr,
                                      Image.asset(
                                        'lib/assets/icons/done.png',
                                        scale: 3,
                                      ),
                                      null);
                                },
                              );
                            }
                          }),
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          if (state.isLoading) Center(child: GFLoader()),
        ],
      ),
    );
  }

  Widget otpTextField(
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
      onFieldSubmitted: onFieldSubmitted,
      focusNode: focusNode,
      maxLength: 6,
      validator: validateOtp,
      decoration: InputDecoration(
        labelText: 'OTP'.tr,
        labelStyle: textDarkLightSmallBR(context),
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        counterText: '',
      ),
    );
  }
}
