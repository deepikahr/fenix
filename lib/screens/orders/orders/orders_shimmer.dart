import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerOrder() => Column(
      children: [
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
        shimmerOrderList(),
        divider(),
        shimmerOrderList(),
        divider(),
        shimmerOrderList(),
      ],
    );
