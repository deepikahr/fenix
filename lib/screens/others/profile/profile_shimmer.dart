import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerProfile() {
  return Container(
    color: Colors.white,
    child: ListView(
      children: [
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              shimmerIconImage(50, 60, 60),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    shimmerText(10, 60),
                    SizedBox(
                      height: 6,
                    ),
                    shimmerText(10, 220),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 20),
                child: shimmerText(8, 20),
              ),
            ],
          ),
        ),
        divider(),
        Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                shimmerProfileListTile(),
                SizedBox(
                  height: 30,
                ),
                shimmerProfileListTile(),
                SizedBox(
                  height: 30,
                ),
                shimmerProfileListTile(),
                SizedBox(
                  height: 30,
                ),
                shimmerProfileListTile(),
              ],
            )),
        // divider(),
        // Container(
        //     color: Colors.white,
        //     padding: EdgeInsets.all(16),
        //     child: Column(
        //       children: [
        //         shimmerProfileListTile(),
        //         SizedBox(
        //           height: 30,
        //         ),
        //         shimmerProfileListTile(),
        //         SizedBox(
        //           height: 30,
        //         ),
        //         shimmerProfileListTile(),
        //       ],
        //     )),
      ],
    ),
  );
}
