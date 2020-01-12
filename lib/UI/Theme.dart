import 'package:flutter/material.dart';

ThemeData easyThemeLight1 = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF3EBACE),
  accentColor: Color(0xFFD8ECF1),
  cardColor: Colors.white,
  scaffoldBackgroundColor: Color(0xFFF3F5F7),
  primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.grey.shade800,
      ),
      body1: TextStyle(
        color: Colors.grey.shade800,
      )),
  accentTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
      ),
      body1: TextStyle(
        color: Colors.white,
      )),
  buttonColor: Colors.blueAccent,
);

ThemeData easyThemeDark1 = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Color(0xFF828282),
  accentColor: Color(0xFF000000),
  cardColor: Color(0XFF222324),
  scaffoldBackgroundColor: Color(0xFF1B1B1B),
  primaryTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
      ),
      body1: TextStyle(
        color: Colors.white,
      )),
  accentTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.grey.shade800,
      ),
      body1: TextStyle(
        color: Colors.grey.shade800,
      )),
  buttonColor: Color(0xff0948DE),
);

ThemeData easyThemeLight2 = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blueAccent,
    accentColor: Colors.blue,
    cardColor: Colors.white,
    scaffoldBackgroundColor: Color(0xFFF3F5F7),
    primaryTextTheme: TextTheme(
        title: TextStyle(
          color: Colors.grey.shade800,
        ),
        body1: TextStyle(
          color: Colors.grey.shade800,
        )),
    accentTextTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
        ),
        body1: TextStyle(
          color: Colors.white,
        )));
