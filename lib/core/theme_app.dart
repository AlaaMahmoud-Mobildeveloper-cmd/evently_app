import 'package:flutter/material.dart';

class ThemeAppData{
  static ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
      centerTitle: true,
    ),
   colorScheme  : ColorScheme(
    brightness: Brightness.light,


    primary: Color(0xFF0E3A99),
    onPrimary: Color(0xFFFFFFFF),

    secondary: Color(0xFF686868),
    onSecondary: Color(0xFFFFFFFF),

    background: Color(0xFFF4F7FF),
    onBackground: Color(0xFF1C1C1C),

    surface: Color(0xFFFFFFFF),
    onSurface: Color(0xFF1C1C1C),


    surfaceVariant: Color(0xFFB9B9B9),
    onSurfaceVariant: Color(0xFF686868),


    outline: Color(0xFFF0F0F0),

    error: Color(0xFFFF3232),
    onError: Color(0xFFFFFFFF),
  )
  );
  static ThemeData darkTheme = ThemeData(
      appBarTheme: AppBarTheme(
        centerTitle: true,
      ),
   colorScheme : ColorScheme(
    brightness: Brightness.dark,


    primary: Color(0xFF457AED),
    onPrimary: Color(0xFFFFFFFF),

    secondary: Color(0xFFD6D6D6),
    onSecondary: Color(0xFF000000),


    background: Color(0xFF000F30),
    onBackground: Color(0xFFFFFFFF),


    surface: Color(0xFF001440),
    onSurface: Color(0xFFFFFFFF),


    surfaceVariant: Color(0xFFB9B9B9),
    onSurfaceVariant: Color(0xFFD6D6D6),

    outline: Color(0xFF002D8F),

    error: Color(0xFFFF3232),
    onError: Color(0xFFFFFFFF),
  )

  );
}