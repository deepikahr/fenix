import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerProductRating() => Column(children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: shimmerIconImage(20, 30, 70),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: shimmerIconImage(20, 30, 70),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                children: [
                  shimmerIconImage(15, 210, 230),
                  SizedBox(
                    height: 20,
                  ),
                  shimmerText(16, 250),
                  SizedBox(
                    height: 15,
                  ),
                  shimmerText(10, 150),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      shimmerIconImage(30, 30, 30),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerIconImage(30, 30, 30),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerIconImage(30, 30, 30),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerIconImage(30, 30, 30),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerIconImage(30, 30, 30),
                    ],
                  ),
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
            SizedBox(
              height: 40,
            ),
            Center(child: shimmerIconImage(5, 40, 300)),
          ],
        ),
      ),
    ]);
