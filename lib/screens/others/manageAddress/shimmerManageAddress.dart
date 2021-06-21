import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerManageAddress() => Column(children: [
      Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: shimmerText(10, 100),
            ),
            shimmerAddressList(),
            divider(),
            shimmerAddressList(),
            divider(),
            shimmerAddressList(),
            divider(),
            shimmerAddressList(),
            divider(),
            shimmerAddressList(),
            divider(),
          ],
        ),
      ),
    ]);
