import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerRestaurantBody() => ListView(children: [
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  shimmerText(20, 150),
                  SizedBox(
                    height: 10,
                  ),
                  shimmerText(10, 100),
                  SizedBox(
                    height: 10,
                  ),
                  shimmerText(10, 100),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      shimmerText(10, 40),
                      shimmerText(10, 40),
                      shimmerText(10, 40),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      shimmerIconImage(2, 30, 80),
                      shimmerIconImage(2, 30, 80),
                      shimmerIconImage(2, 30, 80),
                    ],
                  ),
                ],
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(left: 8, top: 16, right: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 8, left: 8, right: 8),
                        child: shimmerText(5, 80),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      shimmerIconImage(10, 20, 50),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: shimmerText(5, 100),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      shimmerIconImage(10, 20, 20),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            divider(),
            Container(
              color: Colors.white60,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        shimmerText(15, 120),
                        SizedBox(
                          height: 8,
                        ),
                        shimmerText(10, 70),
                      ],
                    ),
                    shimmerIconImage(10, 12, 12)
                  ],
                ),
              ),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: shimmerCatProductList(),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: shimmerCatProductList(),
            )
          ],
        ),
      ),
    ]);
