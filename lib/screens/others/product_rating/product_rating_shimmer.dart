import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerProductRating() => Column(children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  shimmerIconImage(5, 170, 300),
                  SizedBox(
                    height: 40,
                  ),
                  shimmerText(16, 250),
                  SizedBox(
                    height: 20,
                  ),
                  shimmerText(10, 150),
                ],
              ),
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
          ],
        ),
      ),
    ]);
