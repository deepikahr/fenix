import 'package:fenix_user/database/db.dart';
import 'package:fenix_user/models/api_request_models/cart/cart.dart';
import 'package:fenix_user/models/api_response_models/product_details_response/product_details_response.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import 'fab_bottom_app_bar.dart';

Widget primaryButton(BuildContext context, title, onPressed, loading) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(12),
    child: Container(
      width: 164,
      // height: 46,
      //   #00000029
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.2),
            offset: Offset(0.0, 10.0),
            blurRadius: 2.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: GFButton(
        size: GFSize.LARGE,
        borderShape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: primary(),
        onPressed: onPressed,
        child: loading
            ? GFLoader(type: GFLoaderType.ios)
            : Text(
                title,
                style: textWhiteLargeBM(context),
              ),
      ),
    ),
  );
}

Widget primaryButtonSmall(BuildContext context, title, onPressed) {
  return Container(
    // width: 244,
    // height: 46,
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: dark.withOpacity(0.2),
          // offset: Offset(0.5, 0.5),
          blurRadius: 4.0,
          spreadRadius: 1.0,
        ),
      ],
    ),
    child: GFButton(
      size: GFSize.LARGE,
      color: primary(),
      onPressed: onPressed,
      child: Text(
        title,
        style: textWhiteLargeBM(context),
      ),
    ),
  );
}

Widget custombuttonsm(BuildContext context, title, onPressed, isloading) {
  return MaterialButton(
    height: 52,
    // minWidth: 340,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
    color: primary(),
    onPressed: onPressed,
    child: isloading
        ? GFLoader(
            type: GFLoaderType.ios,
          )
        : Text(
            title,
            style: textWhiteLargeBM(context),
          ),
  );
}

Widget custombuttonsmh50(BuildContext context, title, onPressed, isloading) {
  return MaterialButton(
    height: 50,
    // minWidth: 340,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
    color: primary(),
    onPressed: onPressed,
    child: isloading
        ? GFLoader(
            type: GFLoaderType.ios,
          )
        : Text(
            title,
            style: textWhiteLargeBM20(context),
          ),
  );
}

Widget custombuttonsmFW(BuildContext context, title, onPressed, isLoading) {
  return Container(
    height: 46,
    margin: EdgeInsets.only(left: 40, right: 40),
    width: MediaQuery.of(context).size.width,
    child: MaterialButton(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
      color: primary(),
      onPressed: onPressed,
      child: isLoading
          ? GFLoader(type: GFLoaderType.ios)
          : Text(
              title ?? '',
              style: textWhiteLargeBM(context),
            ),
    ),
  );
}

Widget flatPrimaryUnderlineButton(
    BuildContext context, title, Function() onPressed) {
  return Container(
    child: GFButton(
      size: GFSize.LARGE,
      type: GFButtonType.transparent,
      onPressed: onPressed,
      child: Text(
        title,
        style: textPrimarySmallUnderlineBR(context),
      ),
    ),
  );
}

Widget tabIconButton(BuildContext context, iconData, cartData) {
  return Stack(
    alignment: AlignmentDirectional.center,
    children: [
      Image.asset(
        iconData,
        width: 40,
        height: 40,
      ),
      // Positioned(
      //   bottom: 8,
      //   left: 8,
      //   child: GFBadge(
      //           shape: GFBadgeShape.circle,
      //           color: dark,
      //           size: 26,
      //           child: Text(
      //             '$cartData',
      //             textAlign: TextAlign.center,
      //             style: textWhiteXXSmallBM(context),
      //           ),
      //         ),
      // )
    ],
  );
}

Widget customBottomBar(int currentIndex, onSelect, Cart? cart) {
  return FABBottomAppBar(
    centerItemText: 'ASK_FOR'.tr,
    color: Colors.grey,
    selectedColor: primary(),
    notchedShape: CircularNotchedRectangle(),
    onTabSelected: onSelect,
    items: [
      FABBottomAppBarItem(
          iconData: "lib/assets/icons/return.svg",
          text: 'RETURN'.tr,
          total: '0'),
      FABBottomAppBarItem(
          iconData: "lib/assets/icons/drinks.svg",
          text: 'DRINKS'.tr,
          total: '0'),
      FABBottomAppBarItem(
          iconData: "lib/assets/icons/foods.svg", text: 'FOOD'.tr, total: '0'),
      FABBottomAppBarItem(
          iconData: "lib/assets/icons/toPay.svg",
          text: 'TO_PAY'.tr,
          total: cart == null
              ? '0'
              : '${getConfirmedQuantityCount(cart.products)}'),
    ],
    backgroundColor: Colors.grey.shade200,
    currentIndex: currentIndex,
  );
}

Widget buildCenterIcon(BuildContext context, Cart? cart, onTap) {
  return InkWell(
    onTap: onTap,
    child: SizedBox(
      width: 68,
      height: 68,
      child: FittedBox(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            GFAvatar(
              // onPressed: onTap,
              backgroundColor: primary(),
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  'lib/assets/images/pedir.png',
                  width: 120,
                  height: 120,
                  alignment: Alignment.center,
                ),
              ),
            ),
            cart == null ||
                    !DB().isLoggedIn() ||
                    cart.products.length == 0 ||
                    getQuantityCount(cart.products, true) == 0
                ? Container()
                : PositionedDirectional(
                    end: 0,
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: Colors.white, width: 1)),
                      child: GFBadge(
                        shape: GFBadgeShape.circle,
                        color: Colors.black,
                        textColor: GFColors.WHITE,
                        size: GFSize.SMALL,
                        text: '${getQuantityCount(cart.products, true)}',
                      ),
                    ),
                  )
          ],
        ),
      ),
    ),
  );
}

int getQuantityCount(
    List<ProductDetailsResponse> products, bool showModifiedCount) {
  if (DB().getOrderId() == null) {
    int _quantity = products
        .map((e) => showModifiedCount && e.modified
            ? e.modifiedQuantity ?? e.variantQuantity
            : e.variantQuantity)
        .reduce((value, element) => value + element);
    return _quantity;
  } else {
    int _quantity = products
        .map((e) => showModifiedCount && e.modified
            ? ((e.modifiedQuantity ?? e.variantQuantity) - e.variantQuantity) <
                    0
                ? 0
                : (e.modifiedQuantity ?? e.variantQuantity) - e.variantQuantity
            : 0)
        .reduce((value, element) => value + element);
    return _quantity;
  }
}

int getConfirmedQuantityCount(
  List<ProductDetailsResponse> products,
) {
  int _quantity = products
      .map((e) => e.variantQuantity)
      .reduce((value, element) => value + element);
  return _quantity;
}
