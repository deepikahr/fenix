import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'package:restaurant_saas/models/api_response_models/order/order.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/network_image.dart';
import 'buttons.dart';
import 'normalText.dart';
import 'package:get/get.dart';

Widget restaurantCard(BuildContext context, image, title, time) {
  return Container(
    width: 95,
    padding: EdgeInsets.only(right: 16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        networkImage(image, 76, 75, 6),
        Text(
          title,
          style: textDarkSmallBR(context),
          overflow: TextOverflow.ellipsis,
        ),
        Text(time, style: textDarkLight2XSmallBR(context)),
      ],
    ),
  );
}

Widget popularRestaurantCard(BuildContext context, image, title,
    {int width = 68, int height = 68, double radius = 34}) {
  return Container(
    width: 85,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        networkImage(image, width, height, radius),
        Text(
          title ?? '',
          style: textDarkRegularBR14(context),
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget cuisineCard(BuildContext context, image, title) {
  return Container(
    width: 85,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        networkImage(image, 68, 68, 34),
        Text(
          title,
          style: textDarkRegularBR14(context),
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}

Widget carouselCard(BuildContext context, image, title, subTitle, buttonTitle) {
  return Container(
    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 26),
    padding: EdgeInsets.only(left: 16, right: 16),
    decoration:
        BoxDecoration(color: dark, borderRadius: BorderRadius.circular(5)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // Expanded(
        //   child: Container(
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.center,
        //       children: [
        //         Text(
        //           title,
        //           overflow: TextOverflow.ellipsis,
        //           style: textLightXXLargeRR(context),
        //         ),
        //         SizedBox(
        //           height: 6,
        //         ),
        //         Text(
        //           subTitle,
        //           overflow: TextOverflow.ellipsis,
        //           style: textWhiteLightXSmallBR(context),
        //           maxLines: 2,
        //           textAlign: TextAlign.center,
        //         ),
        //         SizedBox(
        //           height: 16,
        //         ),
        //         Container(
        //           height: 22,
        //           width: 126,
        //           child: GFButton(
        //             onPressed: null,
        //             text: buttonTitle,
        //             color: Colors.white,
        //             textStyle: textDarkXXSmallBS(context),
        //           ),
        //         )
        //       ],
        //     ),
        //   ),
        // ),
        networkImage(image, 130, 100, 8)
      ],
    ),
  );
}

Widget restaurantInfoCard(
  BuildContext context,
  String name,
  String? img,
  String cuisines,
  String? address,
  double distance,
  double? rating,
  int? preparationTime,
  String slot,
  bool isFavorite,
  bool isStoreOpen,
) {
  return Container(
    child: Stack(
      children: [
        // Row(
        // mainAxisSize: MainAxisSize.min,
        // mainAxisAlignment: MainAxisAlignment.start,
        // crossAxisAlignment: CrossAxisAlignment.center,
        // children: [
        //  networkImage(img, 97, 109, 10),
        Image.asset(
          'lib/assets/images/refer.png',
          width: MediaQuery.of(context).size.width,
          height: 150,
          fit: BoxFit.fill,
        ),
        Positioned(
            left: 100,
            right: 100,
            bottom: 0,
            child: Container(
              width: 120,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: darkLight,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Text(
                name,
                style: textDarkRegularBRW(context),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )),
        // SizedBox(
        //   width: 16,
        // ),
        // Flexible(
        //   flex: 2,
        //   fit: FlexFit.loose,
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       Row(
        //         children: [
        //           Expanded(
        //             child: Column(
        //               crossAxisAlignment: CrossAxisAlignment.start,
        //               children: [
        //                 Text(
        //                   name,
        //                   style: textDarkRegularBR(context),
        //                   overflow: TextOverflow.ellipsis,
        //                 ),
        //                 SizedBox(
        //                   height: 4,
        //                 ),
        //                 Text(
        //                   cuisines,
        //                   overflow: TextOverflow.ellipsis,
        //                   style: textDarkLight2XSmallBR(context),
        //                 ),
        //                 SizedBox(
        //                   height: 4,
        //                 ),
        //                 Text(
        //                   '$address, ${(distance / 1000.0).toStringAsFixed(2)} ${'KM'.tr}',
        //                   overflow: TextOverflow.ellipsis,
        //                   style: textDarkLight2XSmallBR(context),
        //                 ),
        //                 SizedBox(
        //                   height: 8,
        //                 ),
        //                 ratingDistanceRow(context, rating,
        //                     '$preparationTime ${'MINS'.tr}'),
        //               ],
        //             ),
        //           ),
        //           if (isFavorite)
        //             Align(
        //               alignment: Alignment.centerRight,
        //               child: IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(
        //                   Icons.favorite,
        //                   color: Colors.red,
        //                   size: 25,
        //                 ),
        //               ),
        //             ),
        //         ],
        //       ),
        //       dottedLine(context, darkLight3.withOpacity(0.2), 8),
        //       Row(
        //         children: [
        //           Text(slot, style: textDarkLight2XSmallBR(context)),
        //           Spacer(),
        //           if (!isStoreOpen)
        //             Text('CLOSED'.tr,
        //                 style: textPrimaryLightXSmallBR(context))
        //         ],
        //       ),
        //     ],
        //   ),
        // )
        //   ],
        // ),
      ],
    ),
  );
}

Widget dishesInfoCard(
  BuildContext context,
  String name,
  String? img,
  String? restaurantName,
  String? franchiseName,
  int? time,
  double discount,
  double averageRating,
  double originalPrice,
  double sellingPrice,
  String? description,
  bool? isVeg,
  int totalQautity,
  String? currencySymbol,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  return Container(
    // padding: EdgeInsets.only(left: 16, right: 16),
    color: Colors.white,
    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // height: 145,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  networkImage(img, 105, 109, 4),

                  // Positioned(
                  //   bottom: 0,
                  //   child: Container(
                  //     width: 97,
                  //     height: 38,
                  //     child: totalQautity > 0
                  //         ? Container(
                  //             decoration: BoxDecoration(
                  //                 color: white,
                  //                 border: Border.all(
                  //                     color: grey.shade300, width: 1),
                  //                 borderRadius: BorderRadius.circular(5)),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 InkWell(
                  //                     onTap: onRemove,
                  //                     child: Padding(
                  //                       padding: const EdgeInsets.all(8.0),
                  //                       child: Icon(
                  //                         Icons.remove,
                  //                         color: dark.withOpacity(0.8),
                  //                       ),
                  //                     )),
                  //                 Text('$totalQautity',
                  //                     style: textPrimaryLargeBM(context)),
                  //                 InkWell(
                  //                   onTap: onUpdate,
                  //                   child: Padding(
                  //                     padding: const EdgeInsets.all(8.0),
                  //                     child: Icon(
                  //                       Icons.add,
                  //                       color: dark.withOpacity(0.8),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ))
                  //         : GFButton(
                  //             borderShape: RoundedRectangleBorder(
                  //                 borderRadius: BorderRadius.circular(4),
                  //                 side: BorderSide(color: buttonBorder)),
                  //             onPressed: onAdd,
                  //             color: Colors.white,
                  //             text: 'ADD'.tr,
                  //             textStyle: textPrimaryLargeBM(context),
                  //           ),
                  //   ),
                  // ),
                ],
              ),
            ),
            SizedBox(
              width: 16,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      // (isVeg == null
                      //     ? Container(
                      //         height: 14,
                      //         width: 14,
                      //       )
                      //     : isVeg == true
                      //         ? Container(
                      //             height: 14,
                      //             width: 14,
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(color: green)),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(2.0),
                      //               child: GFAvatar(
                      //                   backgroundColor: green,
                      //                   shape: GFAvatarShape.circle),
                      //             ),
                      //           )
                      //         : Container(
                      //             height: 14,
                      //             width: 14,
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(color: red)),
                      //             child: Padding(
                      //               padding: const EdgeInsets.all(2.0),
                      //               child: GFAvatar(
                      //                   backgroundColor: red,
                      //                   shape: GFAvatarShape.circle),
                      //             ),
                      //           )),
                      // SizedBox(
                      //   width: 5,
                      // ),
                      Expanded(child: titleTextDarkRegularBR(context, name)),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  titleTextDarkLightSmallBR(context, description ?? ''),

                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '$currencySymbol${sellingPrice.toStringAsFixed(2)}',
                        style: textDarkRegularBS(context),
                      ),
                      sellingPrice == originalPrice
                          ? Container()
                          : SizedBox(width: 12),
                      sellingPrice == originalPrice
                          ? Container()
                          : Text(
                              '$currencySymbol${originalPrice.toStringAsFixed(2)}',
                              style: textDarkLight2XSmallLineThroughBR(context),
                            ),
                      Container(
                        // width: 97,
                        // height: 38,
                        child: totalQautity > 0
                            ? Container(
                                decoration: BoxDecoration(
                                    color: white,
                                    // border: Border.all(
                                    //     color: grey.shade300, width: 1),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                        onTap: onRemove,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            width: 35,
                                            height: 35,
                                              decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(
                                        color: dark, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                            child: Icon(
                                              Icons.remove,
                                              color: dark,
                                            ),
                                          ),
                                        )),
                                    Text('$totalQautity',
                                        style: textBlackLargeBM(context)),
                                    InkWell(
                                      onTap: onUpdate,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                            width: 35,
                                            height: 35,
                                              decoration: BoxDecoration(
                                    color: white,
                                    border: Border.all(
                                        color: dark, width: 1),
                                    borderRadius: BorderRadius.circular(50)),
                                          child: Icon(
                                            Icons.add,
                                            color: dark,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ))
                            : GFButton(
                                borderShape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                    side: BorderSide(color: buttonBorder)),
                                onPressed: onAdd,
                                color: Colors.white,
                                text: 'ADD'.tr,
                                textStyle: textPrimaryLargeBM(context),
                              ),
                      ),
                    ],
                  ),
                  // Container(
                  //   padding: EdgeInsets.all(8),
                  //   decoration: BoxDecoration(color: primary,
                  //   borderRadius: BorderRadius.circular(5)
                  //   ),
                  //   child: Text('Allergens',style: textWhiteRegularBM(),),
                  // )
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: Icon(
                  //     Icons.favorite,
                  //     color: Colors.red,
                  //     size: 25,
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
        // dottedLine(context, darkLight3.withOpacity(0.2), 12),
        // Column(
        //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //   crossAxisAlignment: CrossAxisAlignment.start,
        //   children: [
        //     Row(
        //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //       children: [
        //         restaurantLocationRow(context, restaurantName, franchiseName),
        //         discount > 0
        //             ? Row(
        //                 mainAxisAlignment: MainAxisAlignment.end,
        //                 children: [
        //                   Image.asset(
        //                     'lib/assets/icons/discount.png',
        //                     scale: 3,
        //                   ),
        //                   SizedBox(
        //                     width: 6,
        //                   ),
        //                   Text(
        //                     '$discount % ${'OFF'.tr}',
        //                     style: textGreenSmallBM(context: context),
        //                   )
        //                 ],
        //               )
        //             : Container()
        //       ],
        //     ),
        //     SizedBox(
        //       height: 4,
        //     ),
        //     ratingDistanceRow(context, averageRating, '$time ${'MINS'.tr}'),
        //   ],
        // )
      ],
    ),
  );
}

// Widget dishesInfoCard(
//   BuildContext context,
//   String name,
//   String? img,
//   String? restaurantName,
//   String? franchiseName,
//   int? time,
//   double discount,
//   double averageRating,
//   double originalPrice,
//   double sellingPrice,
//   String? description,
//   bool? isVeg,
//   int totalQautity,
//   String? currencySymbol,
//   void Function()? onAdd,
//   void Function()? onUpdate,
//   void Function()? onRemove,
// ) {
//   return Container(
//     padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
//     color: Colors.white,
//     margin: EdgeInsets.only(bottom: 8),
//     child: Column(
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Expanded(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(
//                     height: 16,
//                   ),
//                   Row(
//                     children: [
//                       (isVeg == null
//                           ? Container(
//                               height: 14,
//                               width: 14,
//                             )
//                           : isVeg == true
//                               ? Container(
//                                   height: 14,
//                                   width: 14,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: green)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: GFAvatar(
//                                         backgroundColor: green,
//                                         shape: GFAvatarShape.circle),
//                                   ),
//                                 )
//                               : Container(
//                                   height: 14,
//                                   width: 14,
//                                   decoration: BoxDecoration(
//                                       border: Border.all(color: red)),
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(2.0),
//                                     child: GFAvatar(
//                                         backgroundColor: red,
//                                         shape: GFAvatarShape.circle),
//                                   ),
//                                 )),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       Expanded(child: titleTextDarkRegularBR(context, name)),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   Row(
//                     children: [
//                       Text(
//                         '$currencySymbol${sellingPrice.toStringAsFixed(2)}',
//                         style: textDarkRegularBS(context),
//                       ),
//                       sellingPrice == originalPrice
//                           ? Container()
//                           : SizedBox(width: 12),
//                       sellingPrice == originalPrice
//                           ? Container()
//                           : Text(
//                               '$currencySymbol${originalPrice.toStringAsFixed(2)}',
//                               style: textDarkLight2XSmallLineThroughBR(context),
//                             )
//                     ],
//                   ),
//                   SizedBox(
//                     height: 6,
//                   ),
//                   titleTextDarkLightSmallBR(context, description ?? ''),
//                   // IconButton(
//                   //   onPressed: () {},
//                   //   icon: Icon(
//                   //     Icons.favorite,
//                   //     color: Colors.red,
//                   //     size: 25,
//                   //   ),
//                   // ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               width: 16,
//             ),
//             Container(
//               height: 145,
//               child: Stack(
//                 alignment: AlignmentDirectional.center,
//                 children: [
//                   networkImage(img, 155, 109, 8),
//                   Positioned(
//                     bottom: 0,
//                     child: Container(
//                       width: 97,
//                       height: 38,
//                       child: totalQautity > 0
//                           ? Container(
//                               decoration: BoxDecoration(
//                                   color: white,
//                                   border: Border.all(
//                                       color: grey.shade300, width: 1),
//                                   borderRadius: BorderRadius.circular(5)),
//                               child: Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   InkWell(
//                                       onTap: onRemove,
//                                       child: Padding(
//                                         padding: const EdgeInsets.all(8.0),
//                                         child: Icon(
//                                           Icons.remove,
//                                           color: dark.withOpacity(0.8),
//                                         ),
//                                       )),
//                                   Text('$totalQautity',
//                                       style: textPrimaryLargeBM(context)),
//                                   InkWell(
//                                     onTap: onUpdate,
//                                     child: Padding(
//                                       padding: const EdgeInsets.all(8.0),
//                                       child: Icon(
//                                         Icons.add,
//                                         color: dark.withOpacity(0.8),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ))
//                           : GFButton(
//                               borderShape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(4),
//                                   side: BorderSide(color: buttonBorder)),
//                               onPressed: onAdd,
//                               color: Colors.white,
//                               text: 'ADD'.tr,
//                               textStyle: textPrimaryLargeBM(context),
//                             ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//         dottedLine(context, darkLight3.withOpacity(0.2), 12),
//         Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 restaurantLocationRow(context, restaurantName, franchiseName),
//                 discount > 0
//                     ? Row(
//                         mainAxisAlignment: MainAxisAlignment.end,
//                         children: [
//                           Image.asset(
//                             'lib/assets/icons/discount.png',
//                             scale: 3,
//                           ),
//                           SizedBox(
//                             width: 6,
//                           ),
//                           Text(
//                             '$discount % ${'OFF'.tr}',
//                             style: textGreenSmallBM(context: context),
//                           )
//                         ],
//                       )
//                     : Container()
//               ],
//             ),
//             SizedBox(
//               height: 4,
//             ),
//             ratingDistanceRow(context, averageRating, '$time ${'MINS'.tr}'),
//           ],
//         )
//       ],
//     ),
//   );
// }

Widget productTitleCard(
  BuildContext context,
  String productName,
  String? restaurantName,
  String? franchiseName,
  double averageRating,
  int? preparationTime,
  double leastPrice,
  double highestPrice,
  bool? isVeg,
  currencySymbol,
) {
  return Container(
    padding: EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                (isVeg == null
                    ? Container(
                        height: 14,
                        width: 14,
                      )
                    : isVeg == true
                        ? Container(
                            height: 14,
                            width: 14,
                            decoration:
                                BoxDecoration(border: Border.all(color: green)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GFAvatar(
                                  backgroundColor: green,
                                  shape: GFAvatarShape.circle),
                            ),
                          )
                        : Container(
                            height: 14,
                            width: 14,
                            decoration:
                                BoxDecoration(border: Border.all(color: red)),
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: GFAvatar(
                                  backgroundColor: red,
                                  shape: GFAvatarShape.circle),
                            ),
                          )),
                SizedBox(
                  width: 5,
                ),
                titleTextDarkSmallBR(context, productName),
              ],
            ),
            titleTextDarkRegularBS(context,
                '$currencySymbol$leastPrice - $currencySymbol$highestPrice')
          ],
        ),
        dottedLine(context, darkLight3.withOpacity(0.2), 12),
        restaurantLocationRow(context, restaurantName, franchiseName),
        SizedBox(
          height: 8,
        ),
        ratingDistanceRow(
            context, averageRating, '$preparationTime ${'MINS'.tr}'),
      ],
    ),
  );
}

Widget offerCard(BuildContext context, text1, text2) {
  return Container(
    padding: EdgeInsets.all(6),
    decoration: BoxDecoration(
        border: Border.all(color: buttonBorder),
        borderRadius: BorderRadius.circular(4)),
    child: Row(
      children: [
        Image.asset(
          'lib/assets/icons/discount.png',
          scale: 2,
        ),
        SizedBox(
          width: 12,
        ),
        Column(
          children: [
            titleTextDarkSmallBM(context, text1),
            titleTextDarkLightXSmallBR(context, text2)
          ],
        )
      ],
    ),
  );
}

Widget orderCard(
    BuildContext context, Order order, bool isDetails, currencySymbol) {
  return Container(
    padding: EdgeInsets.only(left: 16, right: 16, top: 16),
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                titleTextDarkSmallBM(context, order.restaurantName),
                SizedBox(
                  height: 5,
                ),
                titleTextDarkLightXSmallBR(context,
                    '${order.franchiseName} , ${order.preparationTime} ${'MINS'.tr}')
              ],
            ),
            isDetails
                ? titleTextDarkLightXSmallBR(
                    context,
                    DateFormat('dd MMM').format(
                        DateTime.parse(order.createdAt.toString()).toLocal()),
                  )
                : titleTextDarkRegularBB(
                    context, '$currencySymbol${order.grandTotal}'),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'lib/assets/icons/accepted.png',
              scale: 3,
            ),
            SizedBox(
              width: 5,
            ),
            if (order.orderStatus == ORDER_STATUS.pending)
              titleTextDarkLightXSmallBR(context, 'Order Pending')
            else if (order.orderStatus == ORDER_STATUS.cancelled)
              titleTextDarkLightXSmallBR(context, 'Order Cancelled')
            else if (order.orderStatus == ORDER_STATUS.confirmed)
              titleTextDarkLightXSmallBR(context, 'Order Confirmed')
            else if (order.orderStatus == ORDER_STATUS.outForDelivery)
              titleTextDarkLightXSmallBR(context, 'Order is on the way')
            else if (order.orderStatus == ORDER_STATUS.delivered)
              titleTextDarkLightXSmallBR(context, 'Order Delivered')
          ],
        ),
        dottedLine(context, darkLight3.withOpacity(0.2), 12),
        titleTextDarkLightXSmallBR(context,
            "${order.cart.map((e) => e.productName! + " x " + e.quantity.toString()).join(', ')}")
      ],
    ),
  );
}

Widget addressBlock(BuildContext context, String addressType,
    String fullAddress, bool isDefault, String defaultLabel,
    {Function? onEdit, Function? onDelete, Function? onSetDefault}) {
  return Container(
      padding: EdgeInsets.only(top: 15),
      margin: EdgeInsets.only(bottom: 10),
      color: Colors.white,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  titleTextDarkSmallBM(context, addressType),
                  Spacer(),
                  if (isDefault)
                    Text(
                      'DEFAULT'.tr,
                      style: TextStyle(
                        color: Colors.lightGreen,
                      ),
                    )
                ],
              ),
              SizedBox(height: 10),
              titleTextDarkLight2SmallBR(context, fullAddress),
            ],
          ),
        ),
        Row(children: [
          flatPrimaryButton(context, 'EDIT'.tr, onEdit),
          flatPrimaryButton(context, 'DELETE'.tr, onDelete),
          SizedBox(
            width: 16,
          ),
          if (!isDefault) flatPrimaryButton(context, defaultLabel, onSetDefault)
        ])
      ]));
}

Widget walletCard(BuildContext context, text1, text2, image, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          border: Border.all(color: buttonBorder, width: 1),
          borderRadius: BorderRadius.circular(5)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(
                image,
                scale: 3,
              ),
              SizedBox(
                width: 6,
              ),
              titleTextDarkLightXSmallBR(context, text1),
            ],
          ),
          Text(
            text2,
            style: textPrimaryXXXLargeBS(context),
          ),
        ],
      ),
    ),
  );
}
