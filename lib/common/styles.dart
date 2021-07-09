import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
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
  static const Color receiveBubble = Color.fromRGBO(114, 95, 84, 1);
  static const Color senderBubble = Color.fromRGBO(176, 154, 141, 1);
  static const Color inviteCodeText = Color.fromRGBO(220, 157, 75, 1);

  static const Color themeLine = Color.fromRGBO(209, 222, 229, 1);
  static const Color tabSelect = Color.fromRGBO(251, 139, 111, 1);
  static const Color tabDeselect = Color.fromRGBO(178, 200, 211, 1);
  static const Color unread = Color.fromRGBO(186, 91, 91, 1);

  static const Color gradientStart = Color.fromRGBO(241, 246, 249, 1);
  static const Color gradientEnd = Color.fromRGBO(230, 238, 243, 1);

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
  static const Color grey166 = Color.fromRGBO(166, 166, 166, 1);

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

  static LinearGradient mainGradientL2R() {
    return Styles.gradientLeft2Right(
        Styles.gradientStart, Styles.gradientEnd);
  }

  static LinearGradient mainGradientT2B() {
    return Styles.gradientTop2Bottom(
        Styles.gradientStart, Styles.gradientEnd);
  }

  /// 常规体，一级字体色
  static TextStyle textStyle(double size) {
    return _textStyleNormal(size).copyWith(color: Styles.mainText);
  }
  /// 中体，一级字体色
  static TextStyle textStyleMedium(double size) {
    return _textStyleMedium(size).copyWith(color: Styles.mainText);
  }
  /// 粗体，一级字体色
  static TextStyle textStyleBold(double size) {
    return _textStyleBold(size).copyWith(color: Styles.mainText);
  }
  /// 花体，一级字体色
  static TextStyle titleTextStyle(double size) {
    return _textStyleFolboBold(size).copyWith(color: Styles.mainText);
  }
  
  /// 常规体，二级字体色
  static TextStyle subTextStyle(double size) {
    return _textStyleNormal(size).copyWith(color: Styles.subText);
  }
  /// 中体，二级字体色
  static TextStyle subTextStyleMedium(double size) {
    return _textStyleMedium(size).copyWith(color: Styles.subText);
  }
  /// 粗体，二级字体色
  static TextStyle subTextStyleBold(double size) {
    return _textStyleBold(size).copyWith(color: Styles.subText);
  }

  /// 常规体，主题字体色
  static TextStyle themeTextStyle(double size) {
    return _textStyleNormal(size).copyWith(color: Styles.themeText);
  }
  /// 中体，主题字体色
  static TextStyle themeTextStyleMedium(double size) {
    return _textStyleMedium(size).copyWith(color: Styles.themeText);
  }
  /// 粗体，主题字体色
  static TextStyle themeTextStyleBold(double size) {
    return _textStyleBold(size).copyWith(color: Styles.themeText);
  }

  /// 粗体，反色
  static TextStyle invertTextStyleBold(double size) {
    return _textStyleBold(size).copyWith(color: Styles.invert);
  }

  static TextStyle _textStyleNormal(double size) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w400,
      color: Styles.mainText,
      decoration: TextDecoration.none,
      fontSize: size,
    );
  }

  static TextStyle _textStyleMedium(double size) {
    return TextStyle(
      fontFamily: 'Gilroy',
      fontWeight: FontWeight.w500,
      color: Styles.mainText,
      decoration: TextDecoration.none,
      fontSize: size,
    );
  }

  static TextStyle _textStyleBold(double size) {
    return TextStyle(
      fontFamily: 'Gilroy',
      color: Styles.mainText,
      fontWeight: FontWeight.w700,
      decoration: TextDecoration.none,
      fontSize: size,
    );
  }

  static TextStyle _textStyleFolboBold(double size) {
    return TextStyle(
        fontFamily: 'Folbo',
        color: Styles.mainText,
        decoration: TextDecoration.none,
        fontSize: size);
  }
}