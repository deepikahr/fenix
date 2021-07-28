import 'package:dotted_line/dotted_line.dart';
import 'package:fenix_user/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'counterBox.dart';

Widget introText(BuildContext context, title1, title2) {
  return Column(
    children: [
      Text(
        title1,
        style: textDarkLargeBM(context),
      ),
      Text(
        title2,
        style: textDarkLargeBM(context),
      )
    ],
  );
}

Widget richText(BuildContext context, title1, title2, onPressed) {
  return InkWell(
    onTap: onPressed,
    child: RichText(
      text: TextSpan(
        text: title1,
        style: textDarkSmallBR(context),
        children: <TextSpan>[
          TextSpan(text: title2, style: textPrimarySmallUnderlineBR(context)),
        ],
      ),
    ),
  );
}

Widget titleTextDarkXXLargeBM(BuildContext context, title) {
  return Text(
    title,
    style: textDarkXXLargeBM(context),
  );
}

Widget titleTextDarkSmallBR(BuildContext context, title) {
  return Text(
    title,
    style: textDarkSmallBR(context),
  );
}

Widget titleTextDarkRegularBR(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBM(context),
  );
}

Widget titleTextDarkRegularBRR(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBR(context),
  );
}

Widget titleTextDarkRegularBS(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBS(context),
  );
}

Widget titleTextDarkRegularBG(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBG(context),
  );
}

Widget titleTextDarkLight3SmallBR(BuildContext context, title) {
  return Text(title, style: textDarkLight3SmallBR(context));
}

Widget titleTextDarkLight2SmallBR(BuildContext context, title) {
  return Text(title, style: textDarkLight2SmallBR(context));
}

Widget titleTextDarkLightSmallBR(BuildContext context, title) {
  return Text(title, style: textDarkLightSmallBR(context));
}

Widget titleTextDark17RegularBR(BuildContext context, title) {
  return Text(title, style: textDark17RegularBR(context));
}

Widget titleTextDarkLightXSmallBR(BuildContext context, String title) {
  return Text(title, style: textDarkLightXSmallBR(context));
}

Widget titleTextDarkLightXSmallBRTR(BuildContext context, String title) {
  return Text(
    title,
    style: textDarkLightXSmallBR(context),
    overflow: TextOverflow.ellipsis,
  );
}

Widget titleTextDarkLightXSmallBL(BuildContext context, title) {
  return Text(title, style: textDarkLightXSmallBL(context));
}

Widget titleTextPrimarySmallBM(BuildContext context, title) {
  return Text(title, style: textPrimarySmallBM(context));
}

Widget titleTextDarkLightSmallBM(BuildContext context, title) {
  return Text(title, style: textDarkLightSmallBM(context));
}

Widget titleTextDarkLightRegularBM(BuildContext context, title) {
  return Text(title, style: textDarkLightRegularBM(context));
}

Widget titleTextDarkXSmallBR(BuildContext context, title) {
  return Text(title, style: textDarkXSmallBR(context));
}

Widget titleTextDarkSmallBM(BuildContext context, title) {
  return Text(title, style: textDarkSmallBM(context));
}

Widget titleTextDarkLightRegularBR(BuildContext context, title) {
  return Text(title, style: textDarkLightRegularBR(context));
}

Widget titleTextDarkRegularBB(BuildContext context, title) {
  return Text(title, style: textDarkRegularBB(context));
}

Widget titleTextDarkRegularBB20(BuildContext context, title) {
  return Text(title, style: textDarkRegularBB(context));
}

Widget titleTextDarkRegularBW(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBW(context),
    textAlign: TextAlign.center,
  );
}

Widget titleTextDarkRegularBW17(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBW17(context),
    textAlign: TextAlign.center,
  );
}

Widget titleTextDarkRegularBW15(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBW15(context),
    textAlign: TextAlign.center,
  );
}

Widget itemTotalAmount(BuildContext context, title) {
  return Text(
    title,
    style: textDarkRegularBB(context),
  );
}

Widget titletextPrimarySmallUnderlineBM(BuildContext context, title) {
  return Text(title, style: textPrimarySmallUnderlineBM(context));
}

Widget titletextBrownSmallBM(BuildContext context, title) {
  return Text(title, style: textBrownSmallBM(context));
}

Widget titletextPrimarySmallBM(BuildContext context, title) {
  return Text(title, style: textPrimarySmallBM(context));
}

Widget titletextDarkLightXXXSmallBR(BuildContext context, title) {
  return Text(
    title,
    style: textDarkLightXXXSmallBR(context),
  );
}

Widget titletextDarkSmallBM(BuildContext context, title) {
  return Text(
    title,
    style: textDarkSmallBM(context),
  );
}

Widget titleViewAllRow(BuildContext context, String title, Function onClick) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: textDark17RegularBR(context)),
        InkWell(
          onTap: onClick as void Function(),
          child: Text(
            'View all',
            style: textDark15RegularBR(context: context),
          ),
        ),
      ],
    ),
  );
}

Widget infoRow(BuildContext context, icon, title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          icon,
          scale: 3,
        ),
        SizedBox(
          width: 5,
        ),
        titleTextDarkLightXSmallBR(context, title)
      ],
    ),
  );
}

Widget ratingDistanceRow(
    BuildContext context, double rating, String distance) {
  return Row(
    children: [
      rating != null && rating > 0
          ? Icon(
              Icons.star,
              size: 14,
              color: darkLight,
            )
          : Container(),
      rating != null && rating > 0
          ? Text(rating.toStringAsFixed(1),
              style: textDarkLight2XSmallBR(context))
          : Container(),
      rating != null && rating > 0
          ? SizedBox(
              width: 4,
            )
          : Container(),
      rating != null && rating > 0
          ? Icon(
              Icons.circle,
              size: 4,
              color: darkLight3,
            )
          : Container(),
      SizedBox(
        width: 4,
      ),
      Text(distance, style: textDarkLight2XSmallBR(context)),
    ],
  );
}

Widget restaurantLocationRow(
    BuildContext context, String restaurant, String location) {
  return RichText(
    text: TextSpan(
      text: 'From  ',
      style: textDarkSmallBR(context),
      children: <TextSpan>[
        TextSpan(text: '$restaurant, ', style: textDarkSmallBM(context)),
        TextSpan(text: location),
      ],
    ),
  );
}

Widget dualText(BuildContext context, text1, text2) {
  return RichText(
    text: TextSpan(
      text: text1,
      style: textDarkSmallBR(context),
      children: <TextSpan>[
        TextSpan(text: text2, style: textDarkSmallBM(context)),
      ],
    ),
  );
}

Widget totalRow(BuildContext context, text1, text2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        text1,
        style: textBlackLargeBM(context),
      ),
      Text(
        text2,
        style: textBlackLargeBM(context),
      ),
    ],
  );
}

Widget dottedLine(BuildContext context, Color color, double height) {
  return Column(
    children: [
      Padding(
        padding: EdgeInsets.symmetric(vertical: height),
        child: DottedLine(
          dashColor: color,
        ),
      ),
    ],
  );
}

Widget verticalDottedLine(BuildContext context, color, double height) {
  return DottedLine(
    dashColor: color,
    direction: Axis.vertical,
    lineLength: height,
    dashLength: 10.0,
    dashGapLength: 2.0,
  );
}

Widget greyDivider(BuildContext context) {
  return Container(height: 8, color: light);
}

Widget greyBgTitleBlock(BuildContext context, title) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    color: light,
    child: Text(
      title,
      style: textDarkLight2SmallBM(context),
    ),
  );
}

Widget paymentListTile(BuildContext context, image, title, subTitle) {
  return GFListTile(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.zero,
    avatar: Image.asset(
      image,
      scale: 3,
    ),
    title: titleTextDarkSmallBR(context, title),
    subTitle: titleTextDarkLightXSmallBL(context, subTitle),
    icon: Image.asset(
      'lib/assets/icons/backArrow.png',
      scale: 3,
    ),
  );
}

Widget iconListTile(
    BuildContext context, String image, String title, Function() onTap,
    {String? description}) {
  return GFListTile(
    padding: EdgeInsets.all(16),
    margin: EdgeInsets.zero,
    avatar: Image.asset(
      image,
      scale: 3,
    ),
    title: titleTextDarkSmallBR(context, title),
    description: description != null
        ? titleTextDarkLightXSmallBR(context, description)
        : null,
    icon: Image.asset(
      'lib/assets/icons/backArrow.png',
      scale: 3,
    ),
    onTap: onTap,
  );
}

Widget itemDescription(context, title, description, total, counter) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          titleTextDarkSmallBR(context, title),
          SizedBox(height: 5),
          titleTextDarkLightXSmallBR(context, description),
          SizedBox(height: 15),
          itemTotalAmount(context, total)
        ],
      ),
      counterBlock(counter, (_) => {}),
    ],
  );
}

Widget iconTextBlock(context, title, image) {
  return Column(
    children: [
      Image.asset(
        image,
        scale: 3,
      ),
      SizedBox(
        height: 5,
      ),
      titleTextDarkLightSmallBR(context, title),
    ],
  );
}

Widget locationTile(BuildContext context, String address) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              flex: 12,
              child: Row(
                children: [
                  Image.asset(
                    'lib/assets/icons/greyLocation.png',
                    scale: 3,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Text(
                      address,
                      style: textDarkLightSmallBR(context),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Image.asset(
                'lib/assets/icons/greyRightArrow.png',
                scale: 3,
              ),
            ),
          ],
        ),
      ),
      Divider(
        color: dark.withOpacity(0.15),
        thickness: 1.5,
        height: 0,
      ),
    ],
  );
}

Widget chatMessgae(BuildContext context, message, isOwn) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.end,
    children: <Widget>[
      Expanded(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isOwn
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 12.0, bottom: 14.0, left: 16.0, right: 16.0),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(0),
                          bottomLeft: Radius.circular(8),
                        ),
                        color: Colors.grey[300],
                      ),
                      child: Text(
                        message,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(
                          top: 12.0, bottom: 14.0, left: 16.0, right: 16.0),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.6,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                          bottomLeft: Radius.circular(0),
                        ),
                        color: primary().withOpacity(0.20),
                      ),
                      child: Text(
                        message,
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ],
                ),
        ),
      ),
    ],
  );
}
