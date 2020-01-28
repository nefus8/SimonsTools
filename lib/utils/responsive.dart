import 'package:flutter/cupertino.dart';

class Responsive {
  static double getResponsiveSize(double size, BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide * MediaQuery.of(context).devicePixelRatio;
    return size * _getRatio(shortestSide);
  }

  static double _getRatio(double shortestSide) {
    return (shortestSide/1125);
  }

  static int getResponsiveNumberOfColumns(BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide * MediaQuery.of(context).devicePixelRatio;
    if (shortestSide <= 650) //iphone 5s
      return 1;
    if (shortestSide > 650 && shortestSide <= 1530) //iphone X
      return 2;
    if (shortestSide > 1530)
      return 3;
  }

  static getDeviceWidth(BuildContext context) {
    return MediaQuery.of(context).size.shortestSide * MediaQuery.of(context).devicePixelRatio;
  }
}