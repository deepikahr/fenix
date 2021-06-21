import 'package:flutter/material.dart';
import 'package:restaurant_saas/styles/styles.dart';

Widget counterBlock(countertext, Function(bool) onChanged) {
  return Container(
    height: 38,
    width: 97,
    padding: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        border: Border.all(color: buttonBorder),
        borderRadius: BorderRadius.circular(4)),
    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      InkWell(
        onTap: () {
          onChanged(false);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.remove,
            size: 15,
          ),
        ),
      ),
      Text(countertext),
      InkWell(
        onTap: () {
          onChanged(true);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.add,
            size: 15,
          ),
        ),
      ),
    ]),
  );
}
