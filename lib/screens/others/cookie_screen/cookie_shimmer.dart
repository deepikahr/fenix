import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerCookie() => Padding(
      padding: const EdgeInsets.all(24.0),
      child: ListView(children: [
        shimmerIconImage(15, 225, 220),
        SizedBox(
          height: 20,
        ),
        shimmerText(20, 250),
        SizedBox(
          height: 15,
        ),
        shimmerText(10, 150),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            shimmerIconImage(5, 120, 350),
          ],
        ),
      ]),
    );
