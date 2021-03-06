import 'dart:async';

import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/screens/home/home.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Thankyou extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final isMounted = useIsMounted();
    final homeNotifier = useProvider(homeTabsProvider.notifier);
    useEffect(() {
      Future.delayed(Duration(seconds: 3), () async {
        // Timer(Duration(seconds: 3), () async {
        if (isMounted()) {
          // Get.offAll(() => HomeTabs());
          homeNotifier.showScreen(Home());
        }
        // });
      });

      return;
    }, const []);

    return Container(
        color: Colors.white,
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xFF359D59),
                      Color(0xFF1B4F2D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'PAID_OUT'.tr} \n ${'THANK_YOU_VERY_MUCH'.tr} \n ${'WE_WAIT_FOR_YOU_SOON'.tr}\n\n',
                    style: textWhiteLargeBMM(context),
                  ),
                  Image.asset(
                    'lib/assets/images/smiley.png',
                    scale: 2,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
