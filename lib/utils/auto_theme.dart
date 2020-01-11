import 'package:flutter/cupertino.dart';

class AutoTheme {
    static bool isDark(BuildContext context) {
      return MediaQuery.of(context).platformBrightness == Brightness.dark;
    }
}