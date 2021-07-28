import 'package:fenix_user/screens/home/home/home.dart';
import 'package:fenix_user/screens/home/home_tabs/homeTabs.dart';
import 'package:fenix_user/screens/others/notify_waiter/notifyWaiter.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'normalText.dart';


Widget primaryButton(BuildContext context, title, onPressed, loading) {
  return Container(
    width: 164,
    // height: 46,
    //   #00000029
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
      child: loading ? GFLoader(type: GFLoaderType.ios) : Text(
        title,
        style: textWhiteLargeBM(context),
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
    height: 36,
    // minWidth: 340,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
    color: primary(),
    onPressed: onPressed,
    child: isloading ? GFLoader(type: GFLoaderType.ios,) : Text(
      title,
      style: textWhiteLargeBM(context),
    ),
  );
}

Widget custombuttonsmFW(BuildContext context, title, onPressed) {
  return MaterialButton(
    height: 46,
    minWidth: 244,
    shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(12)),
    color: primary(),
    onPressed: onPressed,
    child: Text(
      title,
      style: textWhiteLargeBM(context),
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

BottomNavigationBarItem bottomBarTabItem(
    BuildContext context, label, iconData, cartData) {
  return BottomNavigationBarItem(
      label: label, icon: tabIconButton(context, iconData, cartData));
}

