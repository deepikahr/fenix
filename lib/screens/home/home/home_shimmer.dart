import 'package:fenix_user/widgets/shimmer.dart';
import 'package:flutter/material.dart';

Widget shimmerHome() => Container(
  color: Colors.white,
  child: ListView(
    children: [
      Container(
          color: Colors.white,
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          shimmerText(10, 100),
                          SizedBox(
                            height: 10,
                          ),
                          shimmerText(10, 150),
                          SizedBox(
                            height: 10,
                          ),
                          shimmerText(10, 150)
                        ],
                      ),
                    ),
                    shimmerIconImage(8, 100, 130)
                  ],
                ),
              ),
              Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    shimmerIconImage(10, 10, 10),
                    SizedBox(
                      width: 2,
                    ),
                    shimmerIconImage(10, 10, 10),
                    SizedBox(
                      width: 2,
                    ),
                    shimmerIconImage(10, 10, 10),
                  ],
                ),
              )
            ],
          )),
      divider(),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [shimmerText(10, 100), shimmerText(10, 50)],
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      shimmerProductList(),
      SizedBox(
        height: 10,
      ),
      shimmerProductList(),
      SizedBox(
        height: 10,
      ),
      shimmerProductList(),
      SizedBox(
        height: 10,
      ),
      divider(),
      Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [shimmerText(10, 100), shimmerText(10, 50)],
          ),
        ),
      ),
    ],
  ),
);
