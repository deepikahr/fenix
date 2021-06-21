import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:getwidget/getwidget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/others/cookie_dialog/cookieDialog.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/screens/others/cookie_screen/cookieScreenShimmer.dart';
import 'package:get/get.dart';

class CookieScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(cookieScreenProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () {
          context.read(cookieScreenProvider.notifier).fetchLoyaltyDetails();
        });
      }
      return;
    }, const []);

    return Scaffold(
      backgroundColor: white,
      appBar: titleAppbar(context, 'COOKIE_POINT'.tr),
      body: Stack(
        children: [
          if (!state.isLoading)
            ListView(
              children: [
                SizedBox(height: 30),
                Image.asset('lib/assets/images/img1.png',
                    width: 220, height: 225),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'YOU_HAVE'.tr,
                      style: textDarkLargeBMD(context),
                    ),
                    SizedBox(width: 3),
                    Image.asset('lib/assets/images/cookie.png',
                        width: 29, height: 29),
                    SizedBox(width: 3),
                    Text(
                      '${state.loyaltyPoint} ${'COOKIE_POINT'.tr} !',
                      style: textDarkLargeBMD(context),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    '${'YOU_CAN_CLAIM'.tr} ${(state.loyaltyPoint / state.loyaltyPointMonetaryValue).toStringAsFixed(2)}',
                    style: textDarkSmallBROP(context),
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [BoxShadow(color: dark, blurRadius: 0)]),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'HOW_IT_WORKS'.tr,
                        style: textDarkLargeBM(context),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'COOKIE_MSG'.tr,
                        style: textDarkSmallBROP(context),
                      ),
                    ],
                  ),
                )
              ],
            ),
          if (state.isLoading)
            Container(color: Colors.white, child: shimmerCookie())
        ],
      ),
      bottomNavigationBar: (state.isLoading)
          ? Container(height: 1)
          : Container(
              margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              height: 49,
              child: GFButton(
                blockButton: true,
                size: GFSize.LARGE,
                color: primary,
                onPressed: () {
                  if (state.loyaltyPoint > 0) {
                    showDialog(
                        context: context,
                        builder: (context) => CookieDialog(
                                state.loyaltyPoint.toDouble(),
                                state.loyaltyPointMonetaryValue.toDouble(),
                                (value) {
                              if (value != null) {
                                context
                                    .read(cookieScreenProvider.notifier)
                                    .convertLoyaltyToWalletMoney(
                                        double.parse(value));
                              }
                            }));
                  } else {
                    customDialog(
                        title: 'YOU_HAVE_NOT_ENOUGH_POINTS_TO_CONVERT'.tr);
                  }
                },
                child: state.isButtonLoading
                    ? GFLoader(
                        androidLoaderColor:
                            AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
                        'CONVERT_TO_WALLET_MONEY'.tr,
                        style: textWhiteLargeBM(context),
                      ),
              ),
            ),
    );
  }
}
