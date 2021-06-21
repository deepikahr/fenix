import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerCart() => Container(
      color: Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Column(children: [
                Container(
                  child: Row(
                    children: [shimmerText(10, 150)],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          shimmerText(10, 70),
                          SizedBox(
                            height: 5,
                          ),
                          shimmerText(7, 50),
                          SizedBox(
                            height: 20,
                          ),
                          shimmerText(10, 50),
                        ],
                      ),
                      shimmerText(30, 90),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ])),
          divider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 20, 20, 20),
            child: shimmerProfileListTile(),
          ),
          divider(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerText(10, 150),
                      SizedBox(
                        height: 5,
                      ),
                      shimmerText(7, 200),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      shimmerText(40, 70),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerText(40, 70),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerText(40, 70),
                      SizedBox(
                        width: 2,
                      ),
                      shimmerText(40, 70),
                      SizedBox(
                        width: 2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: shimmerProfileListTile(),
                ),
              ],
            ),
          ),
          divider(),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: shimmerText(10, 100),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerText(10, 70),
                      shimmerText(10, 70),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerText(10, 50),
                      shimmerText(10, 50),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 5, 16, 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      shimmerText(10, 70),
                      shimmerText(10, 70),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          divider(),
          SizedBox(height: 12),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: shimmerIconImage(5, 60, 60),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        shimmerText(10, 100),
                        SizedBox(
                          height: 4,
                        ),
                        shimmerText(5, 50),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
