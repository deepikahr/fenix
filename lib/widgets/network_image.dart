import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:restaurant_saas/common/utils.dart';

Widget networkImage(String? url, int width, int height, double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    child: Container(
      width: width.toDouble(),
      height: height.toDouble(),
      child: CachedNetworkImage(
        imageUrl: processImage(
          url,
          width: width + (.5 * width).toInt(),
          height: height + (.5 * height).toInt(),
        ),
      ),
    ),
  );
}
