import 'dart:io';

import 'package:fenix_user/providers/providers.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:get/get.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem({this.iconData, this.text});
  String? iconData;
  String? text;
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
  final ValueChanged<int?>? onTabSelected;

  FABBottomAppBar({
    this.items,
    this.centerItemText,
    this.height: 96.0,
    this.iconSize: 32.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) {
    assert(this.items!.length == 2 || this.items!.length == 4);
  }


  @override
  Widget build(BuildContext context) {

    final state = useProvider(homeTabsProvider);

    onReturn() {
      return showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text('No'),
            ),
            FlatButton(
              onPressed: () => exit(0),
              /*Navigator.of(context).pop(true)*/
              child: Text('Yes'),
            ),
          ],
        ),
      );
    }

    List<Widget> item = List.generate(items!.length, (int index) {
      return _buildTabItem(
        item: items![index],
        index: index,
        sel: state.currentIndex,
        onPressed: (int? index) {
          if(index == 0 && state.currentIndex == 0){
            onReturn();
          }else{
            context.read(homeTabsProvider.notifier).onPageChanged(index);
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
            // offset: Offset(0.5, 0.5),
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
            SizedBox(height: 24,),
            Text(
              centerItemText ?? '',
              style: TextStyle(color: color),
            ),
            SizedBox(height: 4),
            Container(height: 3, color: primary(), width: 56,)
          ],
        ),
      ),
    );
  }

  Widget _buildTabItem({
    FABBottomAppBarItem? item,
    int? index,
    int? sel,
    ValueChanged<int?>? onPressed,
  }) {
    Color? selColor = sel == index ? selectedColor! : color;
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
                // Image.asset(
                //   item!.iconData!,
                //   width: 50,
                //   height: 50,
                // ),
            SvgPicture.asset(
                item!.iconData!,
                width: 60,
                height: 60,
                // color: selColor,
            ),
                // Icon(item!.iconData, color: color, size: widget.iconSize),
                Text(
                  item.text!,
                  style: TextStyle(color: selColor),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}
