import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerFavorites() => Column(children: [
      Container(
        color: Colors.white,
        padding: EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: shimmerIconImage(20, 30, 100),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: shimmerIconImage(20, 30, 100),
            ),
          ],
        ),
      ),
      divider(),
      Padding(
        padding: const EdgeInsets.only(top: 16, left: 8, right: 16),
        child: Column(
          children: [
            shimmerRestaurantsList(),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: divider(height: 1),
            ),
            SizedBox(
              height: 8,
            ),
            shimmerRestaurantsList(),
            SizedBox(
              height: 4,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: divider(height: 1),
            ),
          ],
        ),
      ),
    ]);
