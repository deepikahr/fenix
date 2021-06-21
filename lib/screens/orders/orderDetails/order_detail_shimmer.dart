import 'package:flutter/material.dart';
import 'package:restaurant_saas/widgets/shimmer.dart';

Widget shimmerOrderDetails() => Column(
      children: [
        Container(
          padding: EdgeInsets.all(8),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: shimmerText(10, 120),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(6, 70),
                    shimmerText(6, 30),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  children: [
                    shimmerIconImage(5, 10, 10),
                    SizedBox(
                      width: 5,
                    ),
                    shimmerText(6, 80),
                  ],
                ),
              ),
            ],
          ),
        ),
        divider(),
        Container(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  shimmerIconImage(4, 10, 10),
                  SizedBox(
                    width: 4,
                  ),
                  shimmerText(8, 100)
                ],
              ),
              Row(
                children: [
                  shimmerText(8, 30),
                  SizedBox(
                    width: 10,
                  ),
                  shimmerIconImage(10, 40, 60)
                ],
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: divider(height: 1),
        ),
        Container(
          padding: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  shimmerIconImage(4, 10, 10),
                  SizedBox(
                    width: 4,
                  ),
                  shimmerText(8, 100)
                ],
              ),
              Row(
                children: [
                  shimmerText(8, 30),
                  SizedBox(
                    width: 10,
                  ),
                  shimmerIconImage(10, 40, 60)
                ],
              )
            ],
          ),
        ),
        divider(),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, top: 8, bottom: 16),
                child: shimmerText(10, 100),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(8, 70),
                    shimmerText(8, 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(8, 62),
                    shimmerText(8, 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(8, 80),
                    shimmerText(8, 50),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 4, 8, 16),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(8, 90),
                    shimmerText(8, 60),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    shimmerText(8, 80),
                    shimmerText(8, 50),
                  ],
                ),
              ),
            ],
          ),
        ),
        Divider(),
        Container(
          color: Colors.white,
          padding: EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: shimmerIconImage(2, 26, 100)),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: shimmerIconImage(2, 26, 100)),
                SizedBox(
                  width: 10,
                ),
                Expanded(child: shimmerIconImage(2, 26, 100)),
              ],
            ),
          ),
        ),
      ],
    );
