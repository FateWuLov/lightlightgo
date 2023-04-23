import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData? _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation orientation = Orientation.portrait;
  static double topMargin = 0;
  static double bottomMargin = 0;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData?.size.width ?? 0;
    screenHeight = _mediaQueryData?.size.height ?? 0;
    orientation = _mediaQueryData?.orientation ?? Orientation.portrait;
    topMargin = _mediaQueryData?.padding.top ?? 0;
    bottomMargin = _mediaQueryData?.padding.bottom ?? 0;
    print("Size Config width: $screenWidth  height: $screenHeight");
  }

  static double adaptNormal(double value) {
    double widthScale = screenWidth / 375;
    double heightScale = screenHeight / 667;

    return widthScale > heightScale
        ? (heightScale * value).floorToDouble()
        : (widthScale * value).floorToDouble();
  }
}

// Get the proportionate height as per screen size
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 812 is the layout height that designer use
  return (inputHeight / 812.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 375 is the layout width that designer use
  return (inputWidth / 375.0) * screenWidth;
}

double getProportionateScreenScale(double value) {
  double screenWidth = SizeConfig.screenWidth;
  double screenHeight = SizeConfig.screenHeight;
  double scaleWidth = (screenWidth / 375.0);
  double scaleHeight = (screenHeight / 812.0);
  double scale = scaleWidth > scaleHeight ? scaleHeight : scaleWidth;
  return scale * value;
}