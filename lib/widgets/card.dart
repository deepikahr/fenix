import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/models/api_response_models/product_response/product_response.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:getwidget/getwidget.dart';
import 'package:intl/intl.dart';
import 'buttons.dart';
import 'network_image.dart';
import 'normalText.dart';
import 'package:get/get.dart';

Widget carouselCard(BuildContext context, image, title, subTitle, buttonTitle) {
  return Container(
    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 26),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        networkImage(image, 390, 455, 2)
      ],
    ),
  );
}

Widget restaurantInfoCard(BuildContext context, title, image) {
  return Container(
    child: Stack(
      children: [
        image != null
            ? networkImage(image, 390, 130, 2)
            : networkImageOverlay(390, 130),
        Positioned(
            left: 120,
            right: 120,
            bottom: 0,
            child: Container(
              // width: 80,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: darkLight,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: Text(
                title,
                style: textDarkRegularBRW(context),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    ),
  );
}

Widget restaurantInfoCardGrid(
  BuildContext context,
  String name,
  String? img,
) {
  return Container(
    margin: EdgeInsets.only(
      bottom: 10,
      left: 10,
      right: 10,
    ),
    decoration: BoxDecoration(
        color: white,
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
    child: Stack(
      children: [
        img != null
            ? networkImage(img, MediaQuery.of(context).size.width, 150, 2)
            : networkImageOverlay(MediaQuery.of(context).size.width, 150),
        Positioned(
            left: 25,
            right: 25,
            bottom: 0,
            child: Container(
              // width: 120,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: darkLight,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      topRight: Radius.circular(22))),
              child: Text(
                name,
                style: textDarkRegularBRW(context),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
            )),
      ],
    ),
  );
}

Widget dishesInfoCard(
  BuildContext context,
  ProductDetailsResponse product,
  notifier,
  state,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(16),
      ),
    ),
    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.productImage!.imageUrl != null
                ? networkImage(product.productImage!.imageUrl!, 111, 109, 4)
                : networkImageOverlay(111, 109),
            SizedBox(
              width: 8,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: titleTextDarkRegularBR(
                              context, '${product.productName}')),
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  // titleTextDarkLightSmallBR(context, '${product.productDescription}'),
                  HtmlWidget(
                    product.productDescription!,
                    textStyle: textDarkLightSmallBR(context),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.variant!.price}€',
                        style: textDarkRegularBS(context),
                      ),
                      // sellingPrice == originalPrice
                      //     ? Container()
                      //     : SizedBox(width: 12),
                      // sellingPrice == originalPrice
                      //     ? Container()
                      //     :
                      Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: primary,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Allergens',
                          style: textWhiteRegularBM(),
                        ),
                      ),

                      product.totalQuantity > 0
                          ? Row(
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
                                          borderRadius:
                                              BorderRadius.circular(
                                                  50)),
                                      child: Icon(
                                        Icons.remove,
                                        color: dark,
                                      ),
                                    ),
                                  )),
                              Text(product.totalQuantity.toString(),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Icon(
                                      Icons.add,
                                      color: dark,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GFButton(
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
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: 0,
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset('lib/assets/images/b2.png', scale: 1.4,),
              Text(
                '${product.tags!.first.title}',
                style: textDarkRegularBSW(context),
                textAlign: TextAlign.center,
              ),
            ],
          )
        )
      ],
    ),
  );
}

Widget gridDishCard(
  BuildContext context,
  ProductDetailsResponse product,
  notifier,
  state,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 2)]),
    child: Column(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(6),
              child: Stack(
                children: [
                  product.productImage!.imageUrl != null
                      ? networkImage(product.productImage!.imageUrl!,
                          MediaQuery.of(context).size.width, 115, 0)
                      : networkImageOverlay(
                          MediaQuery.of(context).size.width, 115),
                  Positioned(
                      top: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset('lib/assets/images/b2.png', scale: 1.2,),
                          Text(
                            '${product.tags!.first.title}',
                            style: textDarkRegularBSW(context),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: darkLight,
                        padding: EdgeInsets.all(4),
                        child: Text(
                          '${product.productName}',
                          style: textDarkRegularBSW(context),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          // textAlign: TextAlign.center,
                        ),
                      )),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HtmlWidget(
                    product.productDescription!,
                    textStyle: textDarkLightSmallBR(context),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Container(
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                        color: primary, borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Allergens',
                      style: textWhiteRegularBM(),
                    ),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${product.variant!.price}€',
                        style: textDarkRegularBS(context),
                      ),
                      product.totalQuantity > 0
                          ? Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                      onTap: onRemove,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                              color: white,
                                              border: Border.all(
                                                  color: dark, width: 1),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      50)),
                                          child: Icon(
                                            Icons.remove,
                                            color: dark,
                                          ),
                                        ),
                                      )),
                                  Text(product.totalQuantity.toString(),
                                      style: textBlackLargeBM(context)),
                                  InkWell(
                                    onTap: onUpdate,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        width: 30,
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: white,
                                            border: Border.all(
                                                color: dark, width: 1),
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Icon(
                                          Icons.add,
                                          color: dark,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                          : Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: GFButton(
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
                ],
              ),
            ),
            // ),
          ],
        ),
      ],
    ),
  );
}
