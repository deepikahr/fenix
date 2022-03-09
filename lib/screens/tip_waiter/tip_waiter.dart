import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/qr_screen/qr_screen.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:twemoji/twemoji.dart';

class TipWaiter extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: grey2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('DO_YOU_WANT_TO_ADD_TIP'.tr.toUpperCase(),
                style: textBlackLargeBM(context)),
            SizedBox(height: 10),
            ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: Constants.tipAmountList.length,
                itemBuilder: (BuildContext context, int index) {
                  return tipAmountTile(context, Constants.tipAmountList,
                      Constants.tipAmountEmojiList, index, Constants.currency);
                }),
          ],
        ),
      ),
    );
  }

  Widget tipAmountTile(BuildContext context, List tipAmountList, List emojis,
      int index, String currency) {
    final amount = (tipAmountList[index] == 0)
        ? 'NO_THANKS'.tr.toUpperCase()
        : "${tipAmountList[index]} $currency";
    return Stack(
      children: [
        InkWell(
          onTap: () {
            context.read(homeTabsProvider.notifier).showScreen(QRScreen());
          },
          child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 32.0),
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: red,
                border: Border.all(color: buttonBorder),
              ),
              child: Center(
                child: Text(
                  amount,
                  style: textWhiteRegularBM(),
                ),
              )),
        ),
        Positioned(
          right: 120,
          child: RichText(
            text: TwemojiTextSpan(
              text: "${emojis[index]}",
              emojiFontMultiplier: 3.5,
            ),
          ),
        ),
      ],
    );
  }
}
