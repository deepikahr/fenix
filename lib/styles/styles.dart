import 'package:fenix_user/database/db.dart';
import 'package:flutter/material.dart';

const appBarDark = Color(0xFF222831);

Color primary(){
  print('ccccccccccc ${DB().getThemeColor()}');
  return DB().getThemeColor() == 'red' ? Color(0xFFC92B2B) : DB().getThemeColor() == 'green' ? Color(0xFF5B8E27)
  : DB().getThemeColor() == 'blue' ? Color(0xFF2B80C9) : Color(0xFFED9732);
}

const secondary = Color(0xFFFFDDDD);
const secondary1 = Color(0xFF212730);
const grey = Colors.grey;
const white = Colors.white;
const brown = Color(0xFFD5AF6E);
const lightPrimary = Color(0xFFF7d3d4);

const dark = Color(0xFF37383C);
const light = Color(0xFFF7F7F7);
const buttonBorder = Color(0x37383c33);
const green = Color(0xFF20C978);

final darkLight = dark.withOpacity(0.6);
final darkLight2 = dark.withOpacity(0.8);
final darkLight3 = dark.withOpacity(0.4);

final whiteLight = Colors.white.withOpacity(0.6);
final whiteLight2 = Colors.white.withOpacity(0.8);
final whiteLight3 = Colors.white.withOpacity(0.4);

final primaryLight = primary().withOpacity(0.6);
final primaryLight2 = primary().withOpacity(0.8);
final primaryLight3 = dark.withOpacity(0.4);

final grey1 = Color(0xFFEEEEEE);
final grey2 = Color(0xFFF8F8F8);

final red = Color(0xFFF44242);
final blackN = Color(0xFF37383C);

//----------------------------------- font family for main.dart ---------------------------

const FONT_FAMILY = 'Roboto';

//--------------------------------- screen height & width ----------------------------------

double screenHeight(context) {
  return MediaQuery.of(context).size.height;
}

double screenWidth(context) {
  return MediaQuery.of(context).size.width;
}

// ------------------------------------- barlow - medium --------------------------------

TextStyle textDarkLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textLightLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: light,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textPrimaryLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: primary(),
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textBlackLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.black,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textBlackLargeBM20(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Colors.black,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textBlackLargeBM20G(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 20.0,
    color: Color(0xFF5F5F5F),
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkXXLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkLargeBMD(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 24.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkSmallBROP(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: dark.withOpacity(0.6),
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textWhiteLargeBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.white,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textWhiteLargeBMM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.white,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textWhiteRegularBM() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
    color: white,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textWhiteLightRegularBM() {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 13.0,
    color: white.withOpacity(0.8),
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textWhiteXSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.0,
    color: Colors.white,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textWhite3XSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: whiteLight2,
    fontFamily: 'BarlowMedium',
  );
}


TextStyle textWhiteXXSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10.0,
    color: Colors.white,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textWhiteXXSmall(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: Colors.white,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkSmallUnderlineBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: dark,
    decoration: TextDecoration.underline,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textPrimarySmallUnderlineBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: primary(),
    decoration: TextDecoration.underline,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textBrownSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: brown,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkLightXSmallBLS(context) {
  return TextStyle(
    fontSize: 14.0,
    color: blackN,
    fontFamily: 'BarlowLight',
  );
}

TextStyle textDarkLight2SmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: darkLight2,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkLightSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: darkLight,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textPrimarySmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: primary(),
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textBlackSmallBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textGreenSmallBM({context}) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: green,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textGreenMediumBM({context}) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: green,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkLightRegularBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: darkLight,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkLight2RegularBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: darkLight2,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkRegularBM(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDarkRegularBM10(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDark15RegularBR({context}) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

TextStyle textDark17RegularBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: dark,
    fontFamily: 'BarlowMedium',
  );
}

// ------------------------------------- barlow - regular --------------------------------

TextStyle textDarkSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: dark,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: dark,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkRegularBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: dark,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkRegularBRW(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: white,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBR14(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: dark,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLightRegularBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    color: darkLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLightSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    color: darkLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLightSmallBR9(context) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 9.0,
    color: darkLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLightXXXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 10.0,
    color: darkLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textWhiteLightXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    color: whiteLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLight2SmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: darkLight2,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLight2XSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: darkLight2,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLight2XSmallLineThroughBR(context) {
  return TextStyle(
      fontWeight: FontWeight.w500,
      fontSize: 12.0,
      color: darkLight2,
      fontFamily: 'BarlowRegular',
      decoration: TextDecoration.lineThrough);
}

TextStyle textDarkLightXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: darkLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textPrimaryLightXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: primaryLight,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textDarkLight3SmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: darkLight3,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textWhiteLight3SmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: whiteLight3,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textWhiteSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14.0,
    color: Colors.white,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textPrimarySmallUnderlineBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: primary(),
    decoration: TextDecoration.underline,
    fontFamily: 'BarlowRegular',
  );
}

TextStyle textRedLightXSmallBR(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: red.withOpacity(0.60),
    fontFamily: 'BarlowRegular',
  );
}

// ------------------------------------- barlow - semibold --------------------------------

TextStyle textDarkRegularBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 20.0,
    color: dark,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkRegularBSW(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: white,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkRegularBG(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: Color(0xFF6F757E),
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkRegularBGS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 10.0,
    color: Color(0xFF6F757E),
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkRegularLargeBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 19.0,
    color: dark,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkXXSmallBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 10.0,
    color: dark,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkXXDarkBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 24.0,
    color: dark,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textPrimaryXXXLargeBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 32.0,
    color: primary(),
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textLightRegularBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: light,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textPrimarySmallBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: primary(),
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textGreySmallBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
    color: grey,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textGreenSmallBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: green,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textDarkSmallBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 14.0,
    color: dark,
    fontFamily: 'BarlowSemiBold',
  );
}

TextStyle textWhiteRegularBS(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 17.0,
    color: Colors.white,
    fontFamily: 'BarlowSemiBold',
  );
}
// ------------------------------------- barlow - bold --------------------------------

TextStyle textDarkRegularBB(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 17.0,
    color: dark,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBB20(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 20.0,
    color: dark,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBW(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 25.0,
    color: white,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBW40(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 40.0,
    color: white,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBW17(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 17.0,
    color: white,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkRegularBW15(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 15.0,
    color: white.withOpacity(0.7),
    fontFamily: 'BarlowBold',
  );
}

TextStyle textGreenXXXLBB(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 32.0,
    color: green,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textDarkXXXLBB(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 32.0,
    color: dark,
    fontFamily: 'BarlowBold',
  );
}

TextStyle textblackXLBB(context) {
  return TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18.0,
    color: Colors.black,
    fontFamily: 'BarlowBold',
  );
}

// ------------------------------------- barlow - light --------------------------------

TextStyle textDarkLightXSmallBL(context) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 12.0,
    color: darkLight,
    fontFamily: 'BarlowLight',
  );
}

// ------------------------------------------- Righteous - regular -----------------------------

TextStyle textLightXXLargeRR(context) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 18.0,
    color: Colors.white,
    fontFamily: 'RighteousRegular',
  );
}

TextStyle textPrimarySmallBSLineThrough(context) {
  return TextStyle(
      fontWeight: FontWeight.w600,
      fontSize: 10.0,
      color: primary(),
      fontFamily: 'BarlowSemiBold',
      decoration: TextDecoration.underline);
}
