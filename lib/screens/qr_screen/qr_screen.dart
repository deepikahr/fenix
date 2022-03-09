import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

class QRScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('PAY_WITH_QR'.tr, style: textBlackLargeBM20(context)),
          SizedBox(height: 20),
          Image.asset(
            'lib/assets/icons/qrCode.png',
            scale: 3,
          ),
        ],
      ),
    );
  }
}
