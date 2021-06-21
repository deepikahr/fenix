import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerReferAndEarn() => Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(children: [
        shimmerIconImage(15, 300, 250),
        SizedBox(
          height: 20,
        ),
        shimmerText(20, 150),
        SizedBox(
          height: 15,
        ),
        shimmerText(40, 250),
        SizedBox(
          height: 20,
        ),
        shimmerText(20, 150),
        SizedBox(
          height: 20,
        ),
        shimmerText(40, 250),
        SizedBox(
          height: 20,
        ),
      ]),
    );
