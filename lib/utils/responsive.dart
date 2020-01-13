import 'package:flutter/cupertino.dart';

class Responsive {
  static double getResponsiveSize(double size, BuildContext context) {
    double shortestSide = MediaQuery.of(context).size.shortestSide * MediaQuery.of(context).devicePixelRatio;
    return size * _getRatio(shortestSide);
  }

  static double _getRatio(double shortestSide) {
    if (shortestSide <= 650) //iphone 5s
      return 0.8;
    if (shortestSide > 650 && shortestSide <= 1200) //iphone X
      return 1;
    if (shortestSide > 1200 && shortestSide <= 1530)
      return 1.275;
    if (shortestSide > 1530 && shortestSide <= 2048)
      return 1.7;
    if (shortestSide > 2048)
      return 2;
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
}