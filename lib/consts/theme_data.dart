import 'package:flutter/material.dart';

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    return ThemeData(
        scaffoldBackgroundColor:
            isDarkTheme ? const Color(0xFF00001a) : const Color(0xFFFFFFFF),
        primaryColor: Colors.blue,
        colorScheme: ThemeData().colorScheme.copyWith(
              secondary: isDarkTheme
                  ? const Color(0x0ff1af3c)
                  : const Color(0xFFE8FDFD),
              brightness: isDarkTheme ? Brightness.dark : Brightness.light,
            ),
        cardColor:
            isDarkTheme ? const Color(0x0ff1af3c) : const Color(0xFFE8FDFD),
        canvasColor:
            isDarkTheme ? const Color(0x0ff1af3c) : const Color(0xFFE8FDFD),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
            colorScheme: isDarkTheme
                ? const ColorScheme.dark()
                : const ColorScheme.light()));
  }
}
