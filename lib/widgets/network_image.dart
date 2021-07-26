import 'package:cached_network_image/cached_network_image.dart';
import 'package:fenix_user/common/utils.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

Widget networkImage(String url, double width, double height, double radius) {
  return ClipRRect(
    borderRadius: BorderRadius.all(Radius.circular(radius)),
    child: Container(
      width: width,
      height: height,
      child: CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: processImage(
          url,
          width: width.toInt(),
          height: height.toInt(),
        ),
      ),
    ),
  );
}

Widget networkImageOverlay(double width, double height, ) {
  return Container(
    width: width,
    height: height,
    decoration: BoxDecoration(
      image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.9), BlendMode.darken),
          image: AssetImage(
            'lib/assets/images/refer.png',
          )
      ),
    ),
  );
}

