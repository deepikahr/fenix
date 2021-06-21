import 'dart:ui';
import 'package:get/get.dart';

import 'package:flutter/material.dart';
import 'package:restaurant_saas/styles/styles.dart';

Widget blackAlertBox(BuildContext context, title, icon, onPressed) => Container(
      width: double.infinity,
      height: 176,
      child: AlertDialog(
        insetPadding: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        contentPadding: EdgeInsets.zero,
        backgroundColor: dark,
        content: Container(
          width: double.infinity,
          height: 176,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              icon,
              SizedBox(
                height: 36,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55),
                child: Text(
                  title,
                  style: textWhiteRegularBM(),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );

enum DIALOG_STATUS { SUCCESS, FAIL, WARNING }

Future<void> customDialog(
        {required title,
        icon,
        String? okText,
        onOkListener,
        textConfirm,
        onConfirmListener,
        DIALOG_STATUS? status,
        barrierDismissible = true}) =>
    Get.dialog(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 20),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))),
          contentPadding: EdgeInsets.zero,
          backgroundColor: dark,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, bottom: 20),
                child: icon ??
                    Image.asset(
                      status == DIALOG_STATUS.FAIL
                          ? 'lib/assets/icons/close.png'
                          : status == DIALOG_STATUS.WARNING
                              ? 'lib/assets/icons/warning.png'
                              : 'lib/assets/icons/done.png',
                      scale: 3,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  title,
                  style: textWhiteRegularBM(),
                  textAlign: TextAlign.center,
                ),
              ),
              textConfirm != null
                  ? InkWell(
                      onTap: onConfirmListener,
                      child: Container(
                        padding:
                            const EdgeInsets.only(left: 16, right: 16, top: 16),
                        child: Text(
                          textConfirm,
                          style: textGreenMediumBM(),
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
          actions: [
            textConfirm == null
                ? InkWell(
                    onTap: () {
                      if (onOkListener == null) {
                        Get.back();
                      } else {
                        onOkListener();
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        okText ?? 'OK'.tr,
                        style: textGreenMediumBM(),
                      ),
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      barrierDismissible: barrierDismissible,
    );
