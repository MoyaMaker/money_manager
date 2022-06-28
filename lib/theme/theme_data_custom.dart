import 'package:flutter/material.dart';

class ThemeDataCustom {
  static ThemeData lightTheme = ThemeData(
      // 303030
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          foregroundColor: Colors.black,
          backgroundColor: Color(0xFFFAFAFA),
          elevation: 0.0));

  static ThemeData darkTheme = ThemeData(
      scaffoldBackgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      textTheme: ThemeData.dark().textTheme,
      backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
      cardColor: ThemeData.dark().cardColor,
      appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
          elevation: 0.0));
}
