import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget divider({double? height}) =>
    Container(height: height ?? 8, color: Colors.grey[200]);

Widget shimmerText(double height, double width) => Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
        height: height,
        width: width,
      ),
    );

Widget shimmerIconImage(
  double radius,
  double height,
  double width,
) =>
    Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          color: Colors.white,
        ),
        height: height,
        width: width,
      ),
    );

Widget shimmerProfileListTile() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Row(
        children: [
          shimmerIconImage(10, 20, 20),
          SizedBox(
            width: 20,
          ),
          shimmerText(10, 150),
        ],
      ),
      shimmerIconImage(4, 10, 10)
    ],
  );
}

Widget shimmerProductList() {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
          child: shimmerIconImage(5, 120, 100),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            shimmerText(10, 100),
            SizedBox(
              height: 10,
            ),
            shimmerText(7, 70),
            SizedBox(
              height: 10,
            ),
            shimmerText(7, 70),
            SizedBox(
              height: 10,
            ),
            shimmerText(7, 20)
          ],
        ),
      ],
    ),
  );
}

Widget shimmerRestaurantsList() {
  return Container(
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 5),
          child: shimmerIconImage(5, 100, 90),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 6),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              shimmerText(15, 50),
              SizedBox(
                height: 10,
              ),
              shimmerText(7, 100),
              SizedBox(
                height: 10,
              ),
              shimmerText(10, 150),
              SizedBox(
                height: 10,
              ),
              shimmerText(7, 50),
              divider(),
              shimmerText(7, 150),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget shimmerAddressList() {
  return Container(
    child: Padding(
      padding: const EdgeInsets.only(left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: shimmerText(8, 70),
          ),
          shimmerText(7, 300),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                shimmerText(10, 70),
                SizedBox(
                  width: 20,
                ),
                shimmerText(10, 70),
                SizedBox(
                  width: 20,
                ),
                shimmerText(10, 100),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget shimmerOrderList() => Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: shimmerText(10, 150),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                shimmerText(5, 150),
                shimmerText(15, 70),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                shimmerIconImage(5, 10, 10),
                SizedBox(
                  width: 5,
                ),
                shimmerText(5, 60),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: shimmerText(5, 150),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
        ],
      ),
    );

Widget shimmerCatProductList() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  shimmerText(15, 120),
                  SizedBox(
                    height: 5,
                  ),
                  shimmerText(12, 70),
                  SizedBox(
                    height: 12,
                  ),
                  shimmerText(10, 120),
                ],
              ),
              shimmerIconImage(10, 90, 120),
            ],
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              shimmerText(12, 200),
              SizedBox(
                height: 5,
              ),
              shimmerText(10, 70),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ],
    );

Widget shimmerViewCircularList() {
  return Column(children: [
    Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              shimmerIconImage(50, 70, 70),
              SizedBox(
                height: 5,
              ),
              shimmerText(10, 70),
            ],
          ),
        ],
      ),
    ),
  ]);
}

Widget shimmerCircularList() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        shimmerIconImage(50, 80, 80),
        SizedBox(
          height: 10,
        ),
        shimmerText(10, 80),
      ],
    ),
  );
}

Widget couponsList() {
  return Container(
      color: Colors.white,
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          shimmerText(35, 130),
          SizedBox(
            height: 10,
          ),
          shimmerText(15, 100),
          Divider(),
          shimmerText(10, 120),
          SizedBox(
            height: 20,
          ),
          divider(),
        ],
      ));
}

Widget paymentList() {
  return Container(
    color: Colors.white,
    padding: EdgeInsets.fromLTRB(16, 4, 16, 4),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            shimmerIconImage(40, 60, 60),
            SizedBox(
              width: 5,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 2, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  shimmerText(10, 70),
                  SizedBox(
                    height: 2,
                  ),
                  shimmerText(10, 150),
                ],
              ),
            ),
          ],
        ),
        shimmerIconImage(10, 20, 20),
      ],
    ),
  );
}
