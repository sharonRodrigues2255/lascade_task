import 'package:flutter/widgets.dart';

class SizeConfig {
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;

  static void init(BuildContext context) {
    screenWidth = MediaQuery.sizeOf(context).width;
    screenHeight = MediaQuery.sizeOf(context).height;
  }
}

extension SizeDoubleExt on double {
  double get h {
    double screenHeight = SizeConfig.screenHeight;
    return (this / 812) * screenHeight;
  }

  double get w {
    double screenWidth = SizeConfig.screenWidth;
    return (this / 375) * screenWidth;
  }

}
