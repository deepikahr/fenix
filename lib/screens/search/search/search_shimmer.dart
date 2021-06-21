import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerSearch() => ListView(children: [
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
                  child: shimmerIconImage(20, 30, 80),
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: shimmerIconImage(20, 30, 80),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 8),
              child: shimmerRestaurantsList(),
            ),
            divider(),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: shimmerRestaurantsList(),
            ),
          ],
        ),
      ),
    ]);
