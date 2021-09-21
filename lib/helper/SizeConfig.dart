import 'package:flutter/material.dart';

class SizeConfig {
  static double screenWidth;
  static double screenHeight;
  static double defaultSize;
  static Orientation orientation;
  static MediaQueryData _mediaQueryData;
  void init(BuildContext context) {
    print("you are in the init State Of Size config");
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;

    defaultSize = orientation == Orientation.landscape
        ? screenHeight * .024
        : screenWidth * .024;
  }
}
