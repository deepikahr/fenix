import 'package:flutter/material.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:get/get.dart';
import 'introScreen3.dart';

class IntroScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'lib/assets/images/intro2.png',
            height: screenHeight(context) * 0.7,
            width: screenWidth(context),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 22,
          ),
          introText(context, 'PICK_WHAT_YOU_NEED'.tr, 'AND_ADD_TO_CART'.tr),
          SizedBox(
            height: 30,
          ),
          outlineButton(context, 'NEXT'.tr, () {
            Get.to(() => IntroScreen3());
          }),
        ],
      ),
    );
  }
}
