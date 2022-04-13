import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';

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

Widget counterIcon(type, buttonColor, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: white,
            border:
                Border.all(color: buttonColor == true ? dark : grey, width: 1),
            borderRadius: BorderRadius.circular(50)),
        child: Icon(
          type == 'REMOVE' ? Icons.remove : Icons.add,
          color: buttonColor == true ? dark : grey,
        ),
      ),
    ),
  );
}
