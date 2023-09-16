import 'package:flutter/material.dart';

enum AppTheme {
  normal,
  light,
  dark,
}

final appThemeData = {
  AppTheme.normal: ThemeData(
    primarySwatch: Colors.blue,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  ),
  AppTheme.light: ThemeData(
    fontFamily: 'Hybi11-Amigo',
    primaryColor: const Color(0xffffffff),
    highlightColor: const Color(0xff1977F3),
    hoverColor: const Color(0xff2D3F7B),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Color(0xff444D6E)),
      bodyMedium: TextStyle(color: Color(0xff8E97B7)),
      displayLarge: TextStyle(color: Color(0xff19295C)),
      titleLarge: TextStyle(color: Color(0xffBABDC9)),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Colors.white),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: const Color(0xffF8F9FA),
          secondary: const Color(0xff2D3F7B),
        )
        .copyWith(background: const Color(0xffF6F8FA)),
  ),
  AppTheme.dark: ThemeData(
    fontFamily: 'Hybi11-Amigo',
    primaryColor: const Color(0xff232935),
    highlightColor: Colors.white,
    hoverColor: const Color(0xff282E39),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      displayLarge: TextStyle(color: Colors.white),
      titleLarge: TextStyle(color: Color(0xffBABDC9)),
    ),
    bottomAppBarTheme: const BottomAppBarTheme(color: Color(0xff080E1D)),
    colorScheme: ColorScheme.fromSwatch()
        .copyWith(
          primary: const Color(0xff2A303B),
          secondary: Colors.white,
        )
        .copyWith(background: const Color(0xff080E1D)),
  ),
};
