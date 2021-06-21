import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:restaurant_saas/providers/providers.dart';
import 'package:restaurant_saas/screens/payment/referAndEarn/referAndEarnSimmer.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/alertBox.dart';
import 'package:restaurant_saas/widgets/appbar.dart';
import 'package:restaurant_saas/widgets/buttons.dart';
import 'package:restaurant_saas/widgets/normalText.dart';
import 'package:getwidget/getwidget.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class ReferAndEarn extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final state = useProvider(referPageProvider);
    final isMounted = useIsMounted();

    useEffect(() {
      if (isMounted()) {
        Future.delayed(Duration.zero, () async {
          await context.read(referPageProvider.notifier).fetchReferralData();
        });
      }
      return;
    }, const []);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: titleAppbar(context, 'REFER_AND_EARN'.tr),
      body: state.isLoading
          ? Center(child: shimmerReferAndEarn())
          : Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/assets/images/refer.png',
                  scale: 3,
                ),
                Column(
                  children: [
                    Text(
                      'REFER_AND_EARN'.tr,
                      style: textDarkLight2RegularBM(context),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 46, vertical: 12),
                      child: Text(
                        '${'REFER_US_TO_FRIEND'.tr} ${state.currencySymbol}${state.referralData?.settingData?.bonusToReferralAccount} ${'CREDITED_TO_YOUR_WALLET'.tr}, '
                        '${'YOUR_FRIENDS_WILL_RECEIVE'.tr} ${state.currencySymbol}${state.referralData?.settingData?.bonusToReferralByAccount} ${'AMOUNT_ON_SIGNING_UP_AS_WILL'.tr},',
                        style: textDarkLightSmallBM(context),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    titleTextDarkLight2SmallBR(
                        context, '${'REFERRAL_CODE'.tr}:'),
                    SizedBox(
                      height: 16,
                    ),
                    GFBorder(
                      radius: Radius.circular(4),
                      color: buttonBorder,
                      dashedLine: [4, 6],
                      type: GFBorderType.rRect,
                      child: Container(
                        width: 193,
                        height: 23,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            titleTextDarkLightRegularBR(context,
                                state.referralData?.userData?.referralCode),
                            InkWell(
                                onTap: () {
                                  Clipboard.setData(ClipboardData(
                                          text: state.referralData?.userData
                                              ?.referralCode))
                                      .then((_) async {
                                    Timer(Duration(seconds: 1), () {
                                      Get.back();
                                    });
                                    await showDialog(
                                      barrierColor: secondary,
                                      context: context,
                                      builder: (BuildContext context) {
                                        return blackAlertBox(
                                            context,
                                            'REFERRAL_CODE_COPIED_SUCCESSFULLY'
                                                .tr,
                                            Image.asset(
                                              'lib/assets/icons/done.png',
                                              scale: 3,
                                            ),
                                            null);
                                      },
                                    );
                                  });
                                },
                                child: Image.asset(
                                  'lib/assets/icons/copy.png',
                                  scale: 3,
                                ))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
      bottomNavigationBar: state.isLoading
          ? Container(height: 1)
          : Container(
              padding: EdgeInsets.all(16),
              child: primaryBlockButton(
                  context,
                  state.referralData?.settingData?.isReferralAvailable == true
                      ? 'REFER'.tr
                      : 'REFER_FACILITY_NOT_AVAILABLE_NOW', () {
                if (state.referralData?.settingData?.isReferralAvailable ==
                    true) bottomSheet(context, state);
              }),
            ),
    );
  }

  Future<void> bottomSheet(context, state) {
    return showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
        ),
        builder: (BuildContext context) {
          return Container(
            height: 205,
            child: ListView(
              children: <Widget>[
                Container(
                  alignment: AlignmentDirectional.center,
                  decoration: BoxDecoration(
                    color: light,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  height: 52,
                  child: Text(
                    '${'SHARE_VIA'.tr} :',
                    style: textDarkLargeBM(context),
                  ),
                ),
                SizedBox(
                  height: 26,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          var url =
                              "https://wa.me/?text=${'YOU_CAN_USE_MY_REFFERAL_CODE'.tr} : ${state.currencySymbol}${state.referralData?.settingData?.bonusToReferralAccount} ${'TO_GET'.tr} ${'POINTS_ON_SINGUP'.tr}";
                          var encoded = Uri.encodeFull(url);
                          launchInBrowser(encoded);
                        },
                        child: iconTextBlock(context, 'WHATS_APP'.tr,
                            'lib/assets/icons/whatsapp.png')),
                    InkWell(
                        onTap: () {
                          var url =
                              "sms:?body=${'YOU_CAN_USE_MY_REFFERAL_CODE'.tr} : ${state.currencySymbol}${state.referralData?.settingData?.bonusToReferralAccount} ${'TO_GET'.tr} ${'POINTS_ON_SINGUP'.tr}";
                          var encoded = Uri.encodeFull(url);
                          launchInBrowser(encoded);
                        },
                        child: iconTextBlock(
                            context, 'SMS'.tr, 'lib/assets/icons/chatOn.png')),
                    InkWell(
                        onTap: () {
                          Clipboard.setData(ClipboardData(
                                  text: state
                                      .referralData?.userData?.referralCode))
                              .then((_) async {
                            Timer(Duration(seconds: 1), () {
                              Get.back();
                              Get.back();
                            });
                            await showDialog(
                              barrierColor: secondary,
                              context: context,
                              builder: (BuildContext context) {
                                return blackAlertBox(
                                    context,
                                    'REFERRAL_CODE_COPIED_SUCCESSFULLY'.tr,
                                    Image.asset(
                                      'lib/assets/icons/done.png',
                                      scale: 3,
                                    ),
                                    null);
                              },
                            );
                          });
                        },
                        child: iconTextBlock(context, 'COPY_LINK'.tr,
                            'lib/assets/icons/link.png')),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw '${'COULD_NOT_LAUNCH'.tr} $url';
    }
  }
}
