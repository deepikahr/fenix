import 'package:flutter/material.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:get/get.dart';

class IntroScreen3 extends StatelessWidget {
  final db = DB();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'lib/assets/images/intro3.png',
            height: screenHeight(context) * 0.7,
            width: screenWidth(context),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 22,
          ),
          introText(context, 'OPT_FOR_PICK_UP_OR'.tr, 'DOOR_DELIVERY'.tr),
          SizedBox(
            height: 30,
          ),
          primaryButton(context, 'GET_STARTED'.tr, () {
            var getLocaladdress = db.getLocalAddress();
            Get.offAll(() => getLocaladdress != null
                ? HomeTabs()
                : PickLocation(backButton: false, isHomePage: true));
          }),
        ],
      ),
    );
  }
}
