import 'package:flutter/material.dart';

class ThemeDataCustom {
  static ThemeData lightTheme = ThemeData(
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0.0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ThemeData.dark().colorScheme.primary,
          foregroundColor: Colors.white));

  static ThemeData darkTheme = ThemeData(
      brightness: Brightness.dark,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
          elevation: 0.0),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: ThemeData.dark().colorScheme.primary,
          foregroundColor: Colors.white));
}
