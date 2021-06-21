import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/textFields.dart';

PreferredSizeWidget introAppbar(BuildContext context) {
  return GFAppBar(
    backgroundColor: secondary,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
      ),
    ),
    elevation: 0,
  );
}

PreferredSizeWidget commonAppbar(BuildContext context, title) => GFAppBar(
      backgroundColor: primary,
      centerTitle: true,
      iconTheme: IconThemeData(color: primary),
      title: Text(
        title,
        style: textWhiteRegularBS(context),
      ),
      elevation: 0,
    );

PreferredSizeWidget titleAppbar(BuildContext context, title) {
  return GFAppBar(
    backgroundColor: primary,
    leading: InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
        color: light,
      ),
    ),
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
  );
}

PreferredSizeWidget titleAppbarWithOutBack(BuildContext context, title) {
  return GFAppBar(
    backgroundColor: primary,
    automaticallyImplyLeading: false,
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
  );
}

PreferredSizeWidget homeAppbar(BuildContext context, onTap, title) {
  return GFAppBar(
    backgroundColor: primary,
    automaticallyImplyLeading: false,
    title: InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Image.asset(
            'lib/assets/icons/currentLocation.png',
            scale: 3,
          ),
          SizedBox(width: 6),
          Expanded(
            child: Text(
              title,
              style: textLightRegularBS(context),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 25,
              width: 25,
              child: Image.asset(
                'lib/assets/icons/downArrow.png',
                scale: 3,
              ),
            ),
          ),
        ],
      ),
    ),
    elevation: 0,
  );
}

PreferredSizeWidget searchAppbar(BuildContext context, locationTextField) {
  return PreferredSize(
    preferredSize: Size.fromHeight(62.0),
    child: GFAppBar(
      backgroundColor: primary,
      automaticallyImplyLeading: false,
      title: regularTextField(context, locationTextField),
      elevation: 0,
    ),
  );
}

PreferredSizeWidget titleAppbarWithCart(
    BuildContext context, title, cartCount, void Function()? onCartTap) {
  return GFAppBar(
    backgroundColor: primary,
    leading: InkWell(
      onTap: () {
        Get.back();
      },
      child: Image.asset(
        'lib/assets/icons/leftArrow.png',
        scale: 3,
        color: light,
      ),
    ),
    centerTitle: true,
    title: Text(title, style: textLightRegularBS(context)),
    elevation: 0,
    actions: [
      InkWell(
        onTap: onCartTap,
        child: Padding(
          padding: const EdgeInsets.only(left: 5, right: 5),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              Image.asset(
                'lib/assets/icons/cart1.png',
                scale: 3,
                color: light,
              ),
              Positioned(
                top: 16,
                right: 4,
                child: cartCount == null || cartCount == 0
                    ? Container()
                    : GFBadge(
                        shape: GFBadgeShape.circle,
                        color: dark,
                        size: 26,
                        child: Text(
                          '$cartCount',
                          textAlign: TextAlign.center,
                          style: textWhiteXXSmallBM(context),
                        ),
                      ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}
