import 'package:fenix_user/common/constant.dart';
import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/screens/product/product_list/product_list_notifier.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:fenix_user/widgets/counterBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:html/dom.dart' as dom;
import 'network_image.dart';
import 'normalText.dart';

Widget carouselCard(BuildContext context, image, title, buttonTitle) {
  return Container(
    margin: EdgeInsets.only(left: 8, right: 8, top: 16, bottom: 26),
    decoration: BoxDecoration(color: Colors.black12),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        networkImage(image, MediaQuery.of(context).size.width * 0.8, 220, 5)
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
            ? networkImage(image, MediaQuery.of(context).size.width, 170, 2)
            : networkImageOverlay(MediaQuery.of(context).size.width, 170),
        Positioned(
            // left: 0,
            // right: 0,
            bottom: 0,
            child: Container(
              width: 160,
              alignment: AlignmentDirectional.center,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: darkLight,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4))),
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
            ? networkImage(img, MediaQuery.of(context).size.width, 300, 2)
            : networkImageOverlay(MediaQuery.of(context).size.width, 300),
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
                      topLeft: Radius.circular(4),
                      topRight: Radius.circular(4))),
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
  ProductListNotifier notifier,
  String? categoryImage,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  int getCurrentQuanityOfProduct(ProductDetailsResponse product) =>
      product.modified
          ? product.modifiedQuantity ?? product.variantQuantity
          : product.variantQuantity;

  int getLastOrderedQuantityOfProduct(ProductDetailsResponse product) =>
      DB().getOrderId() != null ? product.variantQuantity : 0;
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(16),
        ),
        boxShadow: [BoxShadow(color: grey.withOpacity(0.3), blurRadius: 10)]),
    margin: EdgeInsets.only(bottom: 16, left: 16, right: 16),
    child: Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            product.productImage?.imageUrl != null
                ? networkImage(product.productImage!.imageUrl!, 218, 150, 1)
                : networkImageOverlay(218, 150),
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
                  if (product.productDescription != null)
                    HtmlWidget(
                      product.productDescription ?? "",
                      textStyle: textDarkLightSmallBR(context),
                    ),
                  if (product.productDescription != null)
                    SizedBox(
                      height: 60,
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (categoryImage != null)
                        Text(
                          '${product.variant!.price}${Constants.currency}',
                          style: textDarkRegularBS(context),
                        ),
                      if (product.productImage!.imageUrl != null)
                        Icon(
                          Icons.camera_alt_rounded,
                          color: primary(),
                        ),
                      if (product.allergens.length > 0)
                        InkWell(
                          onTap: () async {},
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
                        ),
                      (product.modified || product.totalQuantity > 0)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Visibility(
                                  visible: getCurrentQuanityOfProduct(product) >
                                      getLastOrderedQuantityOfProduct(product),
                                  maintainInteractivity: false,
                                  maintainSize: true,
                                  maintainState: true,
                                  maintainAnimation: true,
                                  child: counterIcon('remove', onRemove),
                                ),
                                Text(product.totalQuantity.toString(),
                                    style: textBlackLargeBM(context)),
                                counterIcon('add', onUpdate),
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
        if (product.tags != null && product.tags!.isNotEmpty)
          Positioned(
              top: 0,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'lib/assets/images/b2.png',
                    scale: 0.8,
                    color: primary(),
                  ),
                  Text(
                    '${product.tags!.first.title}',
                    style: textDarkRegularBSW(context),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        Positioned(
          top: 80,
          child: Container(
            alignment: AlignmentDirectional.center,
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            height: 30,
            color: Colors.black45,
            child: Text(
              '${product.variant!.sizeName}',
              style: textWhite3XSmallBM(context),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        if (categoryImage == null)
          Positioned(
            bottom: 10,
            left: 30,
            right: 0,
            child: Text(
              '${product.variant!.price}${Constants.currency}',
              style: textWhiteLargeBMM(context),
            ),
          ),
      ],
    ),
  );
}

Widget gridDishCard(
  BuildContext context,
  ProductDetailsResponse product,
  notifier,
  categoryImage,
  void Function()? onAdd,
  void Function()? onUpdate,
  void Function()? onRemove,
) {
  int getLastOrderedQuantityOfProduct(ProductDetailsResponse product) =>
      DB().getOrderId() != null ? product.totalPreviousQuantity : 0;
  return Container(
    margin: EdgeInsets.only(bottom: 10, left: 8, right: 8),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [BoxShadow(color: grey.withOpacity(0.3), blurRadius: 10)]),
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
                  Column(
                    children: [
                      product.productImage?.imageUrl != null
                          ? networkImage(
                              product.productImage!.imageUrl!,
                              (MediaQuery.of(context).size.width / 2) - 40,
                              170,
                              0)
                          : networkImageOverlay(
                              (MediaQuery.of(context).size.width / 2) - 40,
                              170),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.45,
                        color: Colors.black45,
                        padding: EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${product.productName}',
                              style: textWhiteLightRegularBM(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (categoryImage == null)
                              Text(
                                '${product.variant!.price}${Constants.currency}',
                                style: textWhiteLargeBMM(context),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (product.tags != null && product.tags!.isNotEmpty)
                    Positioned(
                        top: 0,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Image.asset(
                              'lib/assets/images/b2.png',
                              scale: 0.8,
                              color: primary(),
                            ),
                            Text(
                              '${product.tags!.first.title}',
                              style: textDarkRegularBSW(context),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        )),
                  Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        alignment: AlignmentDirectional.center,
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        height: 30,
                        color: Colors.black45,
                        child: Text(
                          '${product.variant!.sizeName}',
                          style: textWhite3XSmallBM(context),
                          textAlign: TextAlign.center,
                        ),
                      )),
                  // Positioned(
                  //   bottom: 0,
                  //   child:
                  // Container(
                  //     width: MediaQuery.of(context).size.width * 0.45,
                  //     color: Colors.black45,
                  //     padding: EdgeInsets.all(12),
                  //     child: Column(
                  //       mainAxisAlignment: MainAxisAlignment.start,
                  //       crossAxisAlignment: CrossAxisAlignment.start,
                  //       children: [
                  //         Text(
                  //           '${product.productName}',
                  //           style: textWhiteLightRegularBM(),
                  //           maxLines: 1,
                  //           overflow: TextOverflow.ellipsis,
                  //         ),
                  //         if (categoryImage == null)
                  //           Text(
                  //             '${product.variant!.price}${Constants.currency}',
                  //             style: textWhiteLargeBMM(context),
                  //           ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (product.productDescription != null)
                    Container(
                      height: 20,
                      child: HtmlWidget(
                        product.productDescription ?? "",
                        textStyle: textDarkLightSmallBR(context),
                        customWidgetBuilder: (dom.Element element) {
                          if (element.localName == 'p') {
                            return Text(
                              element.innerHtml,
                              style: textDarkLightSmallBR(context),
                              maxLines: 1,
                            );
                          }
                        },
                      ),
                    ),
                  if (product.productDescription != null)
                    SizedBox(
                      height: 6,
                    ),
                  if (product.allergens.length > 0)
                    InkWell(
                      onTap: () async {},
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
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      if (categoryImage != null)
                        Text(
                          '${product.variant!.price}${Constants.currency}',
                          style: textDarkRegularBS(context),
                        ),
                      if (product.productImage!.imageUrl != null)
                        Icon(
                          Icons.camera_alt_rounded,
                          color: primary(),
                        ),
                      product.totalQuantity > 0
                          ? Container(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Visibility(
                                      visible: product.totalQuantity >
                                          getLastOrderedQuantityOfProduct(
                                              product),
                                      maintainInteractivity: false,
                                      maintainSize: true,
                                      maintainState: true,
                                      maintainAnimation: true,
                                      child: counterIcon('remove', onRemove)),
                                  Text(product.totalQuantity.toString(),
                                      style: textBlackLargeBM(context)),
                                  counterIcon('add', onUpdate),
                                ],
                              ),
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
            // ),
          ],
        ),
      ],
    ),
  );
}

Widget allergenDialog(BuildContext context, ProductDetailsResponse product) {
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
                itemCount: product.allergens.length,
                itemBuilder: (BuildContext context, int i) {
                  return Column(
                    children: [
                      Image.asset(
                        'lib/assets/images/p3.png',
                        width: 50,
                        height: 50,
                      ),
                      Text(
                        product.allergens[i],
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
