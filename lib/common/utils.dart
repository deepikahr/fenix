import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:restaurant_saas/common/constant.dart';
import 'package:get/get.dart';

String? validateEmailAddress(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'EMAIL_CANT_EMPTY'.tr;
  } else if (!RegExp(Constants.emailVarification).hasMatch(value)) {
    return 'PLEASE_ENTER_VALID_EMAIL'.tr;
  } else {
    return null;
  }
}

String? validateMobile(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'PLEASE_ENTER_PHONE_NUMBER'.tr;
  } else if (!RegExp(Constants.mobileVerification).hasMatch(value)) {
    return 'PLEASE_ENTER_VALID_PHONE_NUMBER'.tr;
  }
  return null;
}

String? validatePassword(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'PASSWORD_CANT_EMPTY'.tr;
  } else if (value.length < 6) {
    return 'PLEASE_ENTER_VALID_PASSWORD'.tr;
  } else {
    return null;
  }
}

String? validateConfirmPassword(String? password, String? value) {
  if (value == null) return null;
  if (value.isEmpty || password != value) {
    return 'PASSWORD_NOT_MATCHED'.tr;
  } else {
    return null;
  }
}

String? validateFirstName(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'FIRST_NAME_CANT_EMPTY'.tr;
  } else {
    return null;
  }
}

String? validateLastName(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'LAST_NAME_CANT_EMPTY'.tr;
  } else {
    return null;
  }
}

String? validateAmount(String? value, {double maxLimit = 0}) {
  if (value == null) {
    return null;
  } else if (value.isEmpty) {
    return 'NUMBER_CANT_EMPTY'.tr;
  } else if (value == '0') {
    return 'NUMBER_CANT_BE_ZERO'.tr;
  } else if (double.parse(value) > maxLimit) {
    return "${'YOU_CANT_ADD_MORE_THAN'.tr} $maxLimit";
  } else {
    return null;
  }
}

String? validateOtp(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'OTP_CANT_EMPTY'.tr;
  } else if (value.length != 6) {
    return 'ENTER_VALID_OTP'.tr;
  } else {
    return null;
  }
}

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}

Future<Uint8List> getBytesFromAsset(String path, int width) async {
  var data = await rootBundle.load(path);
  var codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  var fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}

String processImage(
  String? value, {
  int? height,
  int? width,
  String? aspectRatio,
  bool crop = true,
  bool blur = false,
}) {
  return value?.replaceAll('/tr:dpr-auto,tr:w-auto/',
          '/tr:dpr-auto,w-$width,h-$height,ar-$aspectRatio${blur ? ',bl-4' : ''}${crop ? ',fo-auto' : ''},pr-true,f-auto/') ??
      'https://via.placeholder.com/${width ?? 100}x${height ?? 100}';
}

void handleScrollWithIndex(int index, int pageNumber, Function listener,
    {int pageLimit = 10}) {
  final itemPosition = index + 1;
  final requestMoreData = itemPosition % pageLimit == 0 && itemPosition != 0;
  final pageToRequest = itemPosition ~/ pageLimit;
  if (requestMoreData && pageToRequest + 1 >= pageNumber) {
    listener();
  }
}
