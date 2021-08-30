import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';

class OrdersInProcess extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: light,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 25,
            ),
            Container(
              margin: EdgeInsets.all(15),
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    // stops: [0.1, 0.5, 0.7, 0.9],
                    colors: [
                      Color(0xFF2B80C9),
                      Color(0xFF2989D3),
                      Color(0xFF2886CC),
                      Color(0xFF2887CD),
                      Color(0xFF42ADEA),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${'YOUR_ORDER_IS'.tr} \n ${'IN_PROCESS_...'.tr}\n\n',
                    style: textWhiteLargeBMM(context),
                  ),
                  Image.asset(
                    'lib/assets/images/timer.png',
                    scale: 3,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
