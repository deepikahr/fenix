import 'package:country_code_picker/country_code_picker.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';

Widget customIconTextField(BuildContext context, icon, textField) {
  return Container(
    height: 49,
    decoration: BoxDecoration(
        color: dark.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: icon,
        ),
        Container(
          height: 55,
          width: 2,
          color: dark.withOpacity(0.2),
        ),
        Flexible(child: textField),
      ],
    ),
  );
}

Widget customNumberTextField(BuildContext context, icon, textField,
    Function(CountryCode) onCountryChanged) {
  return Container(
    height: 49,
    decoration: BoxDecoration(
        color: dark.withOpacity(0.15), borderRadius: BorderRadius.circular(4)),
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 6),
          child: CountryCodePicker(
            onChanged: onCountryChanged,
            initialSelection: 'IN',
            favorite: ['+91', 'IN'],
            showCountryOnly: false,
            showOnlyCountryWhenClosed: false,
            alignLeft: false,
          ),
        ),
        Container(
          height: 55,
          width: 2,
          color: dark.withOpacity(0.2),
        ),
        Flexible(child: textField),
      ],
    ),
  );
}

Widget regularTextField(BuildContext context, textField) {
  return Container(
      // height: 49,
      decoration: BoxDecoration(
          color: dark.withOpacity(0.15),
          borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.05),
            blurRadius: 2.0,
            spreadRadius: 2.0,
            // offset: Offset(
            //   1.0,
            //   1.0,
            // ),
          )
        ],
      ),
      child: textField);
}

Widget blockTextField(BuildContext context, textField) {
  return Container(
      decoration: BoxDecoration(
          color: dark.withOpacity(0.04),
          border: Border.all(color: dark.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.05),
            blurRadius: 2.0,
            spreadRadius: 2.0,
            // offset: Offset(
            //   1.0,
            //   1.0,
            // ),
          )
        ],
      ),
      child: textField);
}

Widget blockTextFieldForm(BuildContext context, textField) {
  return Container(
      height: 49,
      decoration: BoxDecoration(
          color: dark.withOpacity(0.04),
          border: Border.all(color: dark.withOpacity(0.16)),
          borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: dark.withOpacity(0.05),
            blurRadius: 2.0,
            spreadRadius: 2.0,
            // offset: Offset(
            //   1.0,
            //   1.0,
            // ),
          )
        ],
      ),
      child: textField);
}
