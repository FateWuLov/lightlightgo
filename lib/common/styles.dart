import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles {
  static const Color mainBg = Color.fromRGBO(241, 246, 249, 1);
  static const Color mainTheme = Color.fromRGBO(77, 126, 150, 1);

  static const Color shadowColor = Color.fromRGBO(222, 233, 240, 1);
  static const Color roundAvatarShadow = Color.fromRGBO(111, 111, 111, 0.16);
  static const Color squareAvatarShadow = Color.fromRGBO(0, 0, 0, 0.12);

  static const Color subTheme = Color.fromRGBO(202, 223, 235, 1);
  static const Color lightTheme = Color.fromRGBO(221, 232, 239, 1);

  static const Color themeLine = Color.fromRGBO(209, 222, 229, 1);
  static const Color tabSelect = Color.fromRGBO(251, 139, 111, 1);
  static const Color tabDeselect = Color.fromRGBO(178, 200, 211, 1);
  static const Color unread = Color.fromRGBO(186, 91, 91, 1);

  static const Color gradientStart = Color.fromRGBO(241, 246, 249, 1);
  static const Color gradientEnd = Color.fromRGBO(230, 238, 243, 1);

  static const Color mainText = Color.fromRGBO(33, 37, 57, 1);
  static const Color subText = Color.fromRGBO(133, 137, 161, 1);

  // 反色文字
  static const Color invert = Colors.white;
  static const Color disableGrey = Color.fromRGBO(172, 172, 172, 1);
  static const Color orderPending = Color.fromRGBO(252, 152, 88, 1);
  static const Color orderTimeColor = Color.fromRGBO(88, 98, 147, 1);
  static const Color buttonBorder = Color.fromRGBO(186, 126, 91, 1);
  static const Color borderShadow = Color.fromRGBO(182, 207, 222, 0.6);

  static LinearGradient gradientTop2Bottom(Color start, Color end) {
    return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [start, end]);
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
  static TextStyle mainThemeStyle(double size) {
    return _textStyleNormal(size).copyWith(color: Styles.mainTheme);
  }
  /// 中体，主题字体色
  static TextStyle mainThemeStyleMedium(double size) {
    return _textStyleMedium(size).copyWith(color: Styles.mainTheme);
  }
  /// 粗体，主题字体色
  static TextStyle mainThemeStyleBold(double size) {
    return _textStyleBold(size).copyWith(color: Styles.mainTheme);
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