import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerWallet() => Container(
      padding: EdgeInsets.all(16),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            shimmerIconImage(5, 220, 340),
            SizedBox(
              height: 40,
            ),
            shimmerIconImage(5, 79, 340),
          ],
        ),
      ),
    );
