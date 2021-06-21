import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/styles/styles.dart';

import 'normalText.dart';

Widget outlineButton(BuildContext context, title, onPressed) {
  return Container(
    width: 164,
    // height: 46,
    child: GFButton(
      size: GFSize.LARGE,
      color: buttonBorder,
      type: GFButtonType.outline,
      onPressed: onPressed,
      child: Text(
        title,
        style: textDarkLargeBM(context),
      ),
    ),
  );
}

Widget smallOutlineButton(BuildContext context, title, onPressed) {
  return GFButton(
    padding: EdgeInsets.symmetric(horizontal: 16),
    color: buttonBorder,
    type: GFButtonType.outline,
    onPressed: onPressed,
    child: Text(
      title,
      textAlign: TextAlign.center,
      style: textDarkSmallBM(context),
    ),
  );
}

Widget primaryButton(BuildContext context, title, onPressed) {
  return Container(
    width: 164,
    // height: 46,
    child: GFButton(
      size: GFSize.LARGE,
      color: primary,
      onPressed: onPressed,
      child: Text(
        title,
        style: textWhiteLargeBM(context),
      ),
    ),
  );
}

Widget primaryButtonSmall(BuildContext context, title, onPressed) {
  return Container(
    // width: 164,
    // height: 46,
    child: GFButton(
      size: GFSize.LARGE,
      color: primary,
      onPressed: onPressed,
      child: Text(
        title,
        style: textWhiteLargeBM(context),
      ),
    ),
  );
}

Widget flatDarkButton(BuildContext context, String title, Function onPressed) {
  return Container(
    // width: 164,
    // height: 46,
    child: GFButton(
      size: GFSize.LARGE,
      type: GFButtonType.transparent,
      onPressed: onPressed as void Function()?,
      child: Text(
        title,
        style: textDarkSmallUnderlineBM(context),
      ),
    ),
  );
}

Widget flatPrimaryUnderlineButton(
    BuildContext context, title, Function() onPressed) {
  return Container(
    // width: 164,
    // height: 46,
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

Widget flatPrimaryButton(
    BuildContext context, String title, Function? onPressed) {
  return Container(
    // width: 164,
    // height: 46,
    child: GFButton(
      size: GFSize.LARGE,
      type: GFButtonType.transparent,
      onPressed: onPressed as void Function()?,
      child: titleTextPrimarySmallBM(context, title),
    ),
  );
}

Widget outlineBlockButton(BuildContext context, title, onPressed) {
  return Container(
    width: screenWidth(context),
    child: GFButton(
      blockButton: true,
      size: GFSize.LARGE,
      color: buttonBorder,
      type: GFButtonType.outline,
      onPressed: onPressed,
      child: Text(
        title,
        style: textDarkLargeBM(context),
      ),
    ),
  );
}

Widget primaryBlockButton(BuildContext context, title, onPressed) {
  return Container(
    width: screenWidth(context),
    child: GFButton(
      blockButton: true,
      size: GFSize.LARGE,
      color: primary,
      onPressed: onPressed,
      child: Text(
        title,
        style: textWhiteLargeBM(context),
      ),
    ),
  );
}

Widget outlineBlockSocialButton(BuildContext context, image, title, onPressed) {
  return Container(
    width: screenWidth(context),
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: GFButton(
        padding: EdgeInsets.zero,
        blockButton: true,
        size: GFSize.LARGE,
        color: buttonBorder,
        type: GFButtonType.outline,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              image,
              scale: 3,
            ),
            Text(
              title,
              style: textDarkLargeBM(context),
            ),
            Image.asset(
              'lib/assets/icons/backArrow.png',
              scale: 3,
            ),
          ],
        )),
  );
}

Widget categoryTabButton(
    BuildContext context, title, onPressed, showRestaurants) {
  return GFButton(
    padding: EdgeInsets.symmetric(horizontal: 16),
    onPressed: onPressed,
    size: GFSize.MEDIUM,
    color: showRestaurants ? dark : buttonBorder,
    type: showRestaurants ? GFButtonType.solid : GFButtonType.outline,
    shape: GFButtonShape.pills,
    child: Text(
      title,
      style: showRestaurants
          ? textWhiteSmallBR(context)
          : textDarkSmallBR(context),
    ),
  );
}

Widget tabIconButton(BuildContext context, iconData, cartData) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0),
    child: Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Icon(
          iconData,
        ),
        Positioned(
          bottom: 8,
          left: 8,
          child: (cartData == null || cartData == 0)
              ? Container()
              : GFBadge(
                  shape: GFBadgeShape.circle,
                  color: dark,
                  size: 26,
                  child: Text(
                    '$cartData',
                    textAlign: TextAlign.center,
                    style: textWhiteXXSmallBM(context),
                  ),
                ),
        )
      ],
    ),
  );
}

BottomNavigationBarItem bottomBarTabItem(
    BuildContext context, label, iconData, cartData) {
  return BottomNavigationBarItem(
      label: label, icon: tabIconButton(context, iconData, cartData));
}

Widget outlineBlockDoubleTextButton(
    BuildContext context, text1, text2, onPressed) {
  return Container(
    width: screenWidth(context),
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: GFButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        blockButton: true,
        size: GFSize.LARGE,
        color: buttonBorder,
        type: GFButtonType.outline,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: textDarkLargeBM(context),
            ),
            Text(
              text2,
              style: textDarkLargeBM(context),
            ),
          ],
        )),
  );
}

Widget primaryBlockSigleTextButton(BuildContext context, text, onPressed) {
  return Container(
    width: screenWidth(context),
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: GFButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        blockButton: true,
        size: GFSize.LARGE,
        color: primary,
        onPressed: onPressed,
        child: Text(
          text,
          style: textLightLargeBM(context),
        )),
  );
}

Widget primaryBlockDoubleTextButton(
    BuildContext context, text1, text2, onPressed) {
  return Container(
    width: screenWidth(context),
    margin: EdgeInsets.symmetric(horizontal: 16),
    child: GFButton(
        padding: EdgeInsets.symmetric(horizontal: 16),
        blockButton: true,
        size: GFSize.LARGE,
        color: primary,
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text1,
              style: textLightLargeBM(context),
            ),
            Text(
              text2,
              style: textLightLargeBM(context),
            ),
          ],
        )),
  );
}

Widget lightBlockDoubleTextButton(
    BuildContext context, text1, text2, onPressed) {
  return GFButton(
      padding: EdgeInsets.symmetric(horizontal: 16),
      blockButton: true,
      size: GFSize.LARGE,
      borderSide: BorderSide(color: buttonBorder),
      color: light,
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text1,
            style: textDarkLightSmallBR(context),
          ),
          Text(
            text2,
            style: textPrimarySmallBM(context),
          ),
        ],
      ));
}
