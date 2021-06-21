import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget paymentWallet() => Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    shimmerIconImage(10, 20, 20),
                    SizedBox(
                      width: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          shimmerText(10, 100),
                          SizedBox(
                            height: 2,
                          ),
                          shimmerText(10, 80),
                        ],
                      ),
                    ),
                  ],
                ),
                shimmerText(10, 100),
              ],
            ),
          ),
          divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                shimmerText(15, 70),
              ],
            ),
          ),
          divider(),
          paymentList(),
          paymentList(),
          divider(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                shimmerText(15, 70),
              ],
            ),
          ),
          divider(),
          paymentList(),
          paymentList(),
          paymentList(),
        ],
      ),
    );
