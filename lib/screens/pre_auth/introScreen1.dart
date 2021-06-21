import 'package:flutter/material.dart';
import 'package:restaurant_saas/database/db.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/pre_auth/pickLocation/pickLocation.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'introScreen2.dart';
import 'package:get/get.dart';

class IntroScreen1 extends StatelessWidget {
  final db = DB();
  @override
  Widget build(BuildContext context) {
    db.saveIntroductionScreen(true);
    return Scaffold(
      body: Column(
        children: [
          Image.asset(
            'lib/assets/images/intro1.png',
            height: screenHeight(context) * 0.7,
            width: screenWidth(context),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 22,
          ),
          introText(
            context,
            'BROWSE_YOUR_FAVORITE'.tr,
            'RESTAURANTS_AND_CUISINES'.tr,
          ),
          SizedBox(
            height: 30,
          ),
          outlineButton(context, 'NEXT'.tr, () {
            Get.to(() => IntroScreen2());
          }),
          flatDarkButton(context, 'SKIP_ALL'.tr, () {
            var getLocalAddres = db.getLocalAddress();
            Get.offAll(() => getLocalAddres != null
                ? HomeTabs()
                : PickLocation(backButton: false, isHomePage: true));
          }),
        ],
      ),
    );
  }
}
