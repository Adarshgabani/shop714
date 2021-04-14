import 'package:flutter/material.dart';

class SizeConfig {
  static MediaQueryData _mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenHeight = _mediaQueryData.size.height;
    screenWidth = _mediaQueryData.size.width;
  }
}

// Get the proportionate height as per screen size
double getScreenHeightandSet(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // 896px is the layout height that designer use
  return (inputHeight / 896.0) * screenHeight;
}

// Get the proportionate height as per screen size
double getScreenWidthandSet(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414px is the layout width that designer use
  return (inputWidth / 414.0) * screenWidth;
}
