import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerViewList(context) => Container(
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      padding: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 16, bottom: 8),
            child: shimmerRestaurantsList(),
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
    );

Widget shimmerCircularViewList(context) => Container(
      color: Colors.white,
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(8),
      child: GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        children: [
          shimmerViewCircularList(),
          shimmerViewCircularList(),
          shimmerViewCircularList(),
          shimmerViewCircularList(),
          shimmerViewCircularList(),
        ],
      ),
    );
