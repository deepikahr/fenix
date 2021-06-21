import 'package:flutter/material.dart';
import 'package:restaurant_saas/screens/home/homeTabs/homeTabs.dart';
import 'package:restaurant_saas/screens/orders/orders/orders_screen.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class ThankYou extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/thankYou.png',
                  scale: 3,
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'ORDER_PLACED'.tr,
                  style: textDarkXXXLBB(context),
                ),
                SizedBox(
                  height: 6,
                ),
                titleTextDarkLightRegularBM(context, 'YOUR_FOOD_EN_ROUTE'.tr),
              ],
            ),
            Positioned(
              bottom: 60,
              child: Column(
                children: [
                  primaryButton(context, 'ORDERS'.tr.toUpperCase(), () async {
                    await Get.offAll(OrdersScreen());
                    await Get.offAll(HomeTabs());
                  }),
                  SizedBox(
                    height: 16,
                  ),
                  outlineButton(context, 'HOME'.tr.toUpperCase(), () {
                    Get.offAll(HomeTabs());
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
