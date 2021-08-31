import 'dart:io';

import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text, this.total});
  String? iconData;
  String? text;
  String? total;
}

class FABBottomAppBar extends HookWidget {
  final List<FABBottomAppBarItem?>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int> onTabSelected;
  final int currentIndex;

  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 96.0,
    this.iconSize: 32.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    required this.onTabSelected,
    required this.currentIndex,
  }) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }

  @override
  Widget build(BuildContext context) {
    onReturn() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('ARE_YOU_SURE'.tr),
          content: Text('DO_YOU_WANT_TO_EXIT_AN_APP'.tr),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('NO'.tr),
            ),
            TextButton(
              onPressed: () => exit(0),
              child: Text('YES'.tr),
            ),
          ],
        ),
      );
    }

    List<Widget> item = List.generate(items!.length, (int index) {
      return _buildTabItem(
        item: items![index],
        index: index,
        sel: currentIndex,
        onPressed: (int index) {
          if (index == 0 && currentIndex == 0) {
            onReturn();
          } else {
            onTabSelected(index);
          }
        },
      );
    });
    item.insert(items!.length >> 1, _buildMiddleTabItem());

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.1),
            blurRadius: 4.0,
            spreadRadius: 4.0,
          ),
        ],
      ),
      child: BottomAppBar(
        elevation: 0.0,
        shape: notchedShape,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: item,
        ),
        color: backgroundColor,
      ),
    );
  }

  Widget _buildMiddleTabItem() {
    return Expanded(
      child: SizedBox(
        height: height,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: iconSize),
            SizedBox(
              height: 24,
            ),
            Text(
              centerItemText ?? '',
              style: tabIconTextBM(color),
            ),
            SizedBox(height: 4),
            Container(
              height: 3,
              color: primary(),
              width: 56,
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    required int index,
    int? sel,
    ValueChanged<int>? onPressed,
  }) {
    Color? selColor = sel == index ? selectedColor! : color;
    print('aaaaaaaaaa ${item!.total}');
    return Expanded(
      child: SizedBox(
        height: height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () => onPressed!(index),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 6,
                ),
                item.total == '0'
                    ? SvgPicture.asset(
                        item.iconData!,
                        width: 60,
                        height: 60,
                        // color: selColor,
                      )
                    : GFIconBadge(
                        position: GFBadgePosition.topEnd(top: -4, end: -10),
                        child: SvgPicture.asset(
                          item.iconData!,
                          width: 60,
                          height: 60,
                          // color: selColor,
                        ),
                        counterChild: Container(
                            alignment: AlignmentDirectional.center,
                            height: 22,
                            width: 22,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.black, width: 3),
                              color: Colors.white,
                            ),
                            child: Text(
                              '${item.total}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                            )
                            // GFBadge(
                            //   shape: GFBadgeShape.circle,
                            //   color: Colors.white,
                            //   textColor: Colors.black,
                            //   size: GFSize.SMALL,
                            //   text: item.total,
                            // ),
                            )),
                SizedBox(
                  height: 6,
                ),
                Text(
                  item.text!,
                  style: tabIconTextBM(selColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
