import 'dart:math';

import 'package:flutter/material.dart';

class AdaptiveUI {
  late MediaQueryData _mediaQueryData;
  static double screenWidth = 0;
  static double screenHeight = 0;
  static double defaultSize = 0;
  static Orientation? orientation;
  static double designHeight = 812;
  static double designWidth = 375;
  static bool? isHypotenuse;

  void init(
      {required BuildContext context,
      required double height,
      required double width,
      bool? hypotenuse}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
    designHeight = height;
    designWidth = width;
    isHypotenuse = hypotenuse ?? false;
  }

  // Get the proportionate height as per screen size
  static double h(double height) {
    double screenHeight = AdaptiveUI.screenHeight;

    if (isHypotenuse == true) {
      double screenWidth = AdaptiveUI.screenWidth;

      var designSize =
          (designWidth * designWidth) + (designHeight * designHeight);
      designSize = sqrt(designSize);

      var screenSize =
          (screenWidth * screenWidth) + (screenHeight * screenHeight);
      screenSize = sqrt(screenSize);

      return (height / designSize) * screenSize;
    }

    return (height / screenHeight) * screenHeight;
  }

  // Get the proportionate width as per screen size
  static double w(double width) {
    double screenWidth = AdaptiveUI.screenWidth;

    if (isHypotenuse == true) {
      double screenHeight = AdaptiveUI.screenHeight;

      var designSize =
          (designWidth * designWidth) + (designHeight * designHeight);
      designSize = sqrt(designSize);

      var screenSize =
          (screenWidth * screenWidth) + (screenHeight * screenHeight);
      screenSize = sqrt(screenSize);
      return (width / designSize) * screenSize;
    }
    return (width / designWidth) * screenWidth;
  }

  // Get the proportionate font size as per screen size
  static double sp(double sp) {
    double screenWidth = AdaptiveUI.screenWidth;

    if (isHypotenuse == true) {
      double screenHeight = AdaptiveUI.screenHeight;

      var designSize =
          (designWidth * designWidth) + (designHeight * designHeight);
      designSize = sqrt(designSize);

      var screenSize =
          (screenWidth * screenWidth) + (screenHeight * screenHeight);
      screenSize = sqrt(screenSize);

      return (sp / designSize) * screenSize;
    }
    return (sp / designWidth) * screenWidth;
  }
}
