import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GlobalColors {
  static const Color mainBg = Color.fromRGBO(241, 246, 249, 1);
  static const Color tabBg = Color.fromRGBO(241, 246, 250, 1);
  static const Color navBg = Color.fromRGBO(241, 246, 250, 1);
  static const Color buttonBg = Color.fromRGBO(77, 126, 150, 1);

  static const Color shadowColor = Color.fromRGBO(222, 233, 240, 1);
  static const Color roundAvatarShadow = Color.fromRGBO(111, 111, 111, 0.16);
  static const Color squareAvatarShadow = Color.fromRGBO(0, 0, 0, 0.12);

  static const Color clearSeen = Color.fromRGBO(33, 37, 57, 1);
  static const Color separator = Color.fromRGBO(29, 31, 33, 1);

  static const Color mainTheme = Color.fromRGBO(77, 126, 150, 1);
  static const Color subTheme = Color.fromRGBO(202, 223, 235, 1);
  static const Color lightTheme = Color.fromRGBO(221, 232, 239, 1);
  static const Color themeText = Color.fromRGBO(77, 126, 150, 1);
  static const Color darkThemeText = Colors.white;
  static const Color receiveBubble = Color.fromRGBO(114, 95, 84, 1);
  static const Color senderBubble = Color.fromRGBO(176, 154, 141, 1);
  static const Color inviteCodeText = Color.fromRGBO(220, 157, 75, 1);

  static const Color themeLine = Color.fromRGBO(209, 222, 229, 1);
  static const Color tabSelect = Color.fromRGBO(251, 139, 111, 1);
  static const Color tabDeselect = Color.fromRGBO(178, 200, 211, 1);
  static const Color unread = Color.fromRGBO(186, 91, 91, 1);

  static const Color gradientStart = Color.fromRGBO(228, 167, 123, 1);
  static const Color gradientEnd = Color.fromRGBO(228, 167, 123, 1);

  static const Color discountGradientStart = Color.fromRGBO(255, 222, 178, 1);
  static const Color discountGradientEnd = Color.fromRGBO(224, 185, 133, 1);

  static const Color darkGoldGradientStart = Color.fromRGBO(216, 164, 134, 1);
  static const Color darkGoldGradientEnd = Color.fromRGBO(186, 126, 91, 1);

  static const Color callingBg = Color.fromRGBO(36, 24, 17, 0.8);

  static const Color mainText = Color.fromRGBO(33, 37, 57, 1);
  static const Color subText = Color.fromRGBO(133, 137, 161, 1);
  static const Color hintText = Color.fromRGBO(133, 137, 161, 1);
  // 反色文字
  static const Color invert = Colors.white;

  static const Color goldText = Color.fromRGBO(255, 163, 0, 1);
  static const Color redText = Color.fromRGBO(255, 0, 20, 1);
  static const Color saleText = Color.fromRGBO(181, 29, 138, 1);
  static const Color orangeText = Color.fromRGBO(255, 172, 39, 1);
  static const Color brownText = Color.fromRGBO(108, 78, 61, 1);

  static const Color disableGrey = Color.fromRGBO(172, 172, 172, 1);
  static const Color greyLine = Color.fromRGBO(14, 15, 16, 1);
  static const Color greyText = Color.fromRGBO(177, 177, 177, 1);
  static const Color grey102 = Color.fromRGBO(102, 102, 102, 1);
  static const Color grey243 = Color.fromRGBO(243, 243, 243, 1);
  static const Color grey216 = Color.fromRGBO(216, 216, 216, 1);
  static const Color grey166 = Color.fromRGBO(166, 166, 166, 1);
  static const Color r151g140b167 = Color.fromRGBO(151, 140, 167, 1);
  static const Color greyWhiteBg = Color.fromRGBO(244, 243, 247, 1);

  static const Color placeholderColor = Colors.black;
  static const Color placeholderColor2 = Colors.black;

  static const Color online = Color.fromARGB(255, 126, 211, 33);
  static const Color busy = Color.fromARGB(255, 238, 21, 46);

  static const Color tarotBg = Colors.black;
  static const Color tarotSection = Colors.black;
  static const Color tarotBorder = Color.fromRGBO(186, 126, 91, 1);

  static const Color orderPending = Color.fromRGBO(202, 115, 86, 1);
  static const Color orderExpired = Color.fromRGBO(64, 98, 154, 1);
  static const Color orderCanceled = Color.fromRGBO(103, 106, 152, 1);
  static const Color orderAwaitingReceipt = Color.fromRGBO(59, 127, 137, 1);
  static const Color orderCompleted = Color.fromRGBO(93, 141, 90, 1);
  static const Color orderDecline = Color.fromRGBO(182, 73, 73, 1);
  static const Color orderDraft = Color.fromRGBO(59, 127, 137, 1);

  static const Color coinsAvailable = Color.fromRGBO(251, 170, 123, 1);
  static const Color rateStarUnselected = Color.fromRGBO(87, 67, 48, 1);
  static const Color buttonBorder = Color.fromRGBO(186, 126, 91, 1);
  static const Color filterServiceCardBorder = Color.fromRGBO(153, 115, 83, 1);
  static const Color switchTrackColor = Color.fromRGBO(84, 84, 84, 1);

  static const Color notificationTipTheme = Color.fromRGBO(255, 182, 129, 1);

  static const Color notifyApplyBackground = Color.fromRGBO(151, 104, 76, 0.9);

  static const Color orderTimeColor = Color.fromRGBO(88, 98, 147, 1);
  static const Color borderShadow = Color.fromRGBO(182, 207, 222, 0.6);

  static LinearGradient gradientTop2Bottom(Color start, Color end) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [start, end]);
  }

  static LinearGradient gradientLeft2Right(Color start, Color end) {
    return LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [start, end]);
  }
}

LinearGradient whiteGradient() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.white, Colors.white]);
}

LinearGradient transparentGradient() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [Colors.transparent, Colors.transparent]);
}

LinearGradient mainGradientLeft2Right() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [GlobalColors.gradientStart, GlobalColors.gradientEnd]);
}

LinearGradient mainGradientTop2Bottom() {
  return LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [GlobalColors.gradientStart, GlobalColors.gradientEnd]);
}

LinearGradient mainDisableGradientLeft2Right() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        GlobalColors.gradientStart.withOpacity(0.36),
        GlobalColors.gradientEnd.withOpacity(0.36)
      ]);
}

LinearGradient mainGradientLeftTop2RightBottom() {
  return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [GlobalColors.gradientStart, GlobalColors.gradientEnd]);
}

LinearGradient discountGradientLeft2Right() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [
        GlobalColors.discountGradientStart,
        GlobalColors.discountGradientEnd
      ]);
}

LinearGradient darkGoldGradientTop2Bottom() {
  return LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        GlobalColors.darkGoldGradientStart,
        GlobalColors.darkGoldGradientEnd
      ]);
}

LinearGradient redGradientLeftTop2RightBottom() {
  return LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Color.fromRGBO(255, 21, 24, 1), Color.fromRGBO(238, 21, 46, 1)]);
}

LinearGradient disableGradient() {
  return LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: [GlobalColors.hintText, GlobalColors.hintText]);
}

BoxDecoration mainGradientDecoration() {
  return BoxDecoration(gradient: mainGradientLeft2Right());
}

TextStyle mainTextStyleRegular(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.mainText);
}

TextStyle themeTextStyleBold(double size) {
  return textStyleBold(size).copyWith(color: GlobalColors.themeText);
}

TextStyle subTextStyle(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.subText);
}

TextStyle textStyleTitleBold(double size) {
  return TextStyle(
    fontFamily: 'Luminari',
    color: GlobalColors.mainText,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w700,
    fontSize: size,
    height: 1.4,
  );
}

TextStyle textStyleTitle(double size) {
  return TextStyle(
    fontFamily: 'Luminari',
    color: GlobalColors.mainText,
    decoration: TextDecoration.none,
    fontWeight: FontWeight.w400,
    fontSize: size,
    height: 1.4,
  );
}

TextStyle textStyleNormal(double size) {
  return TextStyle(
    fontFamily: 'Baskerville',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: GlobalColors.mainText,
    decoration: TextDecoration.none,
    fontSize: size,
    height: 1.2,
  );
}

TextStyle inviteCodeTextStyle(double size) {
  return TextStyle(
    fontFamily: 'Gilroy',
    fontWeight: FontWeight.w400,
    color: GlobalColors.mainText,
    decoration: TextDecoration.none,
    fontSize: size,
    height: 1.4,
  );
}

TextStyle textStyleBold(double size) {
  return TextStyle(
    fontFamily: 'Baskerville-SemiBold',
    color: GlobalColors.mainText,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
    fontSize: size,
    height: 1.2,
  );
}

TextStyle textStyleMedium(double size) {
  return TextStyle(
    fontFamily: 'Baskerville-SemiBold',
    fontWeight: FontWeight.w600,
    color: GlobalColors.mainText,
    decoration: TextDecoration.none,
    fontSize: size,
    height: 1.2,
  );
}

TextStyle textStyleGenevaBold(double size, {height: 1.4, color: GlobalColors.mainText}) {
  return TextStyle(
      fontFamily: 'Baskerville',
      fontWeight: FontWeight.w700,
      color: color,
      decoration: TextDecoration.none,
      fontSize: size,
      height: height);
}

TextStyle textStyleJostSemiBold(double size,
    {height: 1.4, color: GlobalColors.mainText}) {
  return TextStyle(
      fontFamily: 'Jost-SemiBold',
      fontWeight: FontWeight.w600,
      color: color,
      decoration: TextDecoration.none,
      fontSize: size,
      height: height);
}

TextStyle textStyleJostBold(double size, {height: 1.4, color: GlobalColors.mainText}) {
  return TextStyle(
      fontFamily: 'Jost-SemiBold',
      fontWeight: FontWeight.w700,
      color: color,
      decoration: TextDecoration.none,
      fontSize: size,
      height: height);
}

TextStyle textStyleBitterExtraBoldItalic(double size,
    {height: 1.4, color: GlobalColors.mainText}) {
  return TextStyle(
    fontFamily: 'Baskerville',
    fontWeight: FontWeight.w700,
    fontStyle: FontStyle.italic,
    color: color,
    decoration: TextDecoration.none,
    fontSize: size,
    height: height,
  );
}

TextStyle textStyleAppleChancery(double size,
    {height: 1.4, color: GlobalColors.mainText}) {
  return TextStyle(
    fontFamily: 'Baskerville',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w600,
    color: color,
    decoration: TextDecoration.none,
    fontSize: size,
    height: height,
  );
}

TextStyle mainTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.mainText);
}

TextStyle subTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.subText);
}

TextStyle greyTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.greyText);
}

TextStyle themeTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.themeText);
}

TextStyle darkThemeTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.darkThemeText);
}

TextStyle themeTextStyleMedium(double size) {
  return textStyleMedium(size).copyWith(color: GlobalColors.themeText);
}

TextStyle opacityTextStyleNormal(double size) {
  return textStyleNormal(size).copyWith(color: GlobalColors.tabBg);
}