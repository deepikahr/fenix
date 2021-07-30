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
    decoration: BoxDecoration(
      // boxShadow: [
      //   BoxShadow(
      //     color: dark.withOpacity(0.2),
      //     // offset: Offset(0.5, 0.5),
      //     blurRadius: 4.0,
      //     spreadRadius: 1.0,
      //   ),
      // ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        networkImage(image, MediaQuery.of(context).size.width *  0.9, 455, 5)
      ],
    ),
  );
}

Widget restaurantInfoCard(BuildContext context, title, image) {
  return Container(
    margin: EdgeInsets.only(bottom: 12),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        image != null
            ? networkImage(image, MediaQuery.of(context).size.width, 120, 2)
            : networkImageOverlay(MediaQuery.of(context).size.width, 120),
        Positioned(
            // left: 0,
            // right: 0,
            bottom: 0,
            child: Container(
              width: 120,
              alignment: AlignmentDirectional.center,
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
  String? name,
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
                name!,
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
categoryImage,
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
       boxShadow: [
        BoxShadow(color: grey.withOpacity(0.3), blurRadius: 10)
      ]
    ),
    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image.asset(
            //   'lib/assets/images/refer.png', height: 111, width: 109,
            // ),
            categoryImage != null ?
            networkImage(categoryImage, 111, 109, 1)
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
                      categoryImage != null ? Text(
                        '${product.variant!.price}€',
                        style: textDarkRegularBS(context),) : Container(),
                      product.productImage!.imageUrl != null ?
                      Icon(Icons.camera_alt_rounded, color: primary(),) : Container(),
                      product.allergens!.length > 0 ? InkWell(
                        onTap: () async {
                          // await showDialog(
                          //     context: context,
                          //     builder: (context) =>
                          //         allergenDialog(context, product));
                        },
                        child: Container(
                          padding: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: primary(),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            'ALLERGENS'.tr,
                            style: textWhiteRegularBM(),
                          ),
                        ),
                      ) : Container(),

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
              Image.asset('lib/assets/images/b2.png', scale: 1.4, color: primary(),),
              Text(
                '${product.tags!.first.title}',
                style: textDarkRegularBSW(context),
                textAlign: TextAlign.center,
              ),
            ],
          )
        ),
        Positioned(
            top: 40,
            child: Container(
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              height: 25,
              color: Colors.black45,
              child: Text('${product.variant!.sizeName}',
                style: textWhite3XSmallBM(context),
                textAlign: TextAlign.center,),
            )
        ),
        categoryImage == null ? Positioned(
          bottom: 10, left: 30, right: 0,
          child: Text(
            '${product.variant!.price}€',
            style: textWhiteLargeBMM(context),
          ),
        ) : Container()
      ],
    ),
  );
}

Widget gridDishCard(
  BuildContext context,
  ProductDetailsResponse product,
  notifier,
  state,
categoryImage,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  return Container(
    margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(color: grey.withOpacity(0.3), blurRadius: 10)
        ]
    ),
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
                  // Image.asset(
                  //   'lib/assets/images/refer.png', height: 115, width: MediaQuery.of(context).size.width,
                  // ),
                  categoryImage != null
                      ? networkImage(categoryImage,
                          MediaQuery.of(context).size.width, 115, 0)
                      : networkImageOverlay(
                          MediaQuery.of(context).size.width, 115),
                  Positioned(
                      top: 0,
                      child: Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          Image.asset('lib/assets/images/b2.png', scale: 1.2, color: primary(),),
                          Text(
                            '${product.tags!.first.title}',
                            style: textDarkRegularBSW(context),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      )
                  ),
                  Positioned(
                      top: 0, right: 0,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        height: 25,
                        color: Colors.black45,
                        child: Text('${product.variant!.sizeName}',
                          style: textWhite3XSmallBM(context),
                          textAlign: TextAlign.center,),
                      )
                  ),
                  Positioned(
                      bottom: 0,
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: Colors.black45,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product.productName}',
                              style: textWhiteLightRegularBM(),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              // textAlign: TextAlign.center,
                            ),
                            categoryImage == null ? Text(
                              '${product.variant!.price}€',
                              style: textWhiteLargeBMM(context),
                            ) : Container()
                          ],
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
                  product.allergens!.length > 0 ? InkWell(
                    onTap: () async {
                      // await showDialog(
                      //     context: context,
                      //     builder: (context) =>
                      //         allergenDialog(context, product));
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                          color: primary(), borderRadius: BorderRadius.circular(5)),
                      child: Text(
                        'ALLERGENS'.tr,
                        style: textWhiteRegularBM(),
                      ),
                    ),
                  ) : Container(),
                  SizedBox(
                    height: 6,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryImage != null ? Text(
                        '${product.variant!.price}€',
                        style: textDarkRegularBS(context),
                      ) : Container(),
                      product.productImage!.imageUrl != null ?
                      Icon(Icons.camera_alt_rounded, color: primary(),) : Container(),
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


Widget allergenDialog(BuildContext context,  ProductDetailsResponse product){
  return Dialog(
    child: Container(
      height: 165,
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          titleTextDark17RegularBR(
            context,
            'ALLERGENS'.tr,
          ),
          Container(
            alignment: AlignmentDirectional.topStart,
            height: 85,
            child: ListView.builder(
                physics: ScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: product.allergens!.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/p3.png',
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        product.allergens![i],
                        style: textDarkRegularBM10(context),
                      ),
                      Text(
                        'DESCRIPTION'.tr,
                        style: textDarkLightSmallBR9(context),
                      )
                    ],
                  );
                }),
          ),
        ],
      ),
    ),
  );
}