import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

Widget tipsRow(
  context,
  List<int> tips,
  double selectedTip,
  controller,
  Function(double) onSelected,
) {
  return Container(
    height: 41,
    width: double.infinity,
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Center(
      child: ListView.separated(
        separatorBuilder: (_, __) => SizedBox(
          width: 20,
        ),
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: tips.length + 1,
        itemBuilder: (context, i) {
          if (i == tips.length) {
            return othersTipBlock(controller, onSelected);
          } else if (selectedTip == tips[i]) {
            return InkWell(
              onTap: () => onSelected(tips[i].toDouble()),
              child: selectedTipBlock(
                tips[i].toString(),
                context,
                () {
                  onSelected(0);
                },
              ),
            );
          } else {
            return InkWell(
              onTap: () => onSelected(tips[i].toDouble()),
              child: singletipBlock(tips[i].toString()),
            );
          }
        },
      ),
    ),
  );
}

Widget singletipBlock(String tip) {
  return Container(
    height: 41,
    width: 69,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: buttonBorder),
        borderRadius: BorderRadius.circular(4)),
    child: Text(tip),
  );
}

Widget othersTipBlock(controller, Function(double) onSelected) {
  return Container(
    height: 41,
    width: 69,
    alignment: Alignment.center,
    decoration: BoxDecoration(
        border: Border.all(color: buttonBorder),
        borderRadius: BorderRadius.circular(4)),
    child: TextFormField(
      onChanged: (value) {
        onSelected(-1);
      },
      controller: controller,
      keyboardType: TextInputType.phone,
      inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*$')),
      ],
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: '${'OTHER'.tr}',
        hintStyle: TextStyle(color: Colors.black12),
        border: InputBorder.none,
      ),
    ),
  );
}

Widget selectedTipBlock(String tip, BuildContext context, Function onRemoved) {
  return Container(
    alignment: Alignment.center,
    height: 41,
    width: 69,
    padding: EdgeInsets.only(left: 10, right: 10),
    decoration: BoxDecoration(
        color: lightPrimary,
        border: Border.all(color: primary()),
        borderRadius: BorderRadius.circular(4)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tip,
          style: textPrimarySmallBM(context),
        ),
        InkWell(
          onTap: onRemoved as void Function(),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset('lib/assets/icons/delete.png', scale: 3),
          ),
        )
      ],
    ),
  );
}
