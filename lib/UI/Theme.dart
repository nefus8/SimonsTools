import 'package:flutter/material.dart';

ThemeData easyThemeLight = ThemeData(
  brightness: Brightness.light,
  primaryColor: Color(0xFF3EBACE),
  accentColor: Color(0xFFD8ECF1),
  scaffoldBackgroundColor: Color(0xFFF3F5F7),
  primaryTextTheme: TextTheme(
    title: TextStyle(
      color: Colors.grey.shade800,
    ),
    body1: TextStyle(
      color: Colors.grey.shade800,
    )
  ),
  accentTextTheme: TextTheme(
      title: TextStyle(
        color: Colors.white,
      ),
      body1: TextStyle(
        color: Colors.white,
      )
  )
);

ThemeData easyThemeDark = ThemeData(
  brightness: Brightness.dark,
    primaryColor: Color(0xFF828282),
    accentColor: Color(0xFF000000),
    scaffoldBackgroundColor: Color(0xFF1B1B1B),
    primaryTextTheme: TextTheme(
        title: TextStyle(
          color: Colors.white,
        ),
        body1: TextStyle(
          color: Colors.white,
        )
    ),
    accentTextTheme: TextTheme(
        title: TextStyle(
          color: Colors.grey.shade800,
        ),
        body1: TextStyle(
          color: Colors.grey.shade800,
        )
    )
);