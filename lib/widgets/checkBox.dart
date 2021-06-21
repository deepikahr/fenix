import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:restaurant_saas/styles/styles.dart';
import 'package:restaurant_saas/widgets/normalText.dart';

Widget normalCheckBox(context, text, onchanged, value) {
  return GFCheckboxListTile(
    padding: EdgeInsets.all(0),
    margin: EdgeInsets.all(0),
    title: titleTextDarkLightSmallBR(context, text),
    position: GFPosition.start,
    size: 20,
    activeBgColor: primary,
    inactiveBgColor: light,
    inactiveBorderColor: Colors.black12,
    activeIcon: Icon(
      Icons.check,
      size: 10,
      color: Colors.white,
    ),
    type: GFCheckboxType.square,
    onChanged: onchanged,
    value: value,
  );
}
