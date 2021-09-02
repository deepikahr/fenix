import 'package:get/get.dart';

String? validateTableNumber(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'TABLE_NUMBER_CANT_EMPTY'.tr;
  } else {
    return null;
  }
}

String? validateFranchiseCode(String? value) {
  if (value == null) return null;
  if (value.isEmpty) {
    return 'FRANCHISE_CODE_CANT_EMPTY'.tr;
  } else {
    return null;
  }
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

void printWrapped(String text) {
  final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}
