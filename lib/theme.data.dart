import 'package:flutter/material.dart' hide Theme;
import 'package:vendedor_tienda/models/theme.dart';

const Color primary = Color.fromRGBO(255, 142, 1, 1);
const Color primaryVariant = Color.fromRGBO(255, 242, 1, 1);
const Color secundary = Color.fromRGBO(27, 113, 186, 1);
const Color secundaryVariant = Color.fromRGBO(149, 26, 130, 1);

final Map<Theme, ThemeData> themesData = {
  Theme.ligth: ThemeData(
    textTheme: const TextTheme(labelLarge: TextStyle(color: Colors.white)),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.white),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.white,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
    ),
    colorScheme: const ColorScheme(
      primary: primary,
      primaryContainer: primaryVariant,
      secondary: secundary,
      secondaryContainer: secundaryVariant,
      surface: Colors.white,
      background: Colors.white,
      error: Colors.redAccent,
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: primary,
      onBackground: primary,
      onError: Colors.white,
      brightness: Brightness.light,
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  ),
  Theme.dark: ThemeData(
    primaryColor: const Color.fromRGBO(255, 142, 1, 1),
    colorScheme: const ColorScheme(
        primary: primary,
        primaryContainer: primaryVariant,
        secondary: secundary,
        secondaryContainer: secundaryVariant,
        surface: Colors.white,
        background: Colors.white,
        error: Colors.redAccent,
        onPrimary: Colors.white,
        onSecondary: Colors.white,
        onSurface: primary,
        onBackground: primary,
        onError: Colors.white,
        brightness: Brightness.dark),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
      bodySmall: TextStyle(color: Colors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: const TextStyle(color: Colors.amber),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: const BorderSide(
            color: Colors.white,
          )),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: primary,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: primary,
          width: 1.5,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 1.5,
        ),
      ),
    ),
    bottomSheetTheme:
        BottomSheetThemeData(backgroundColor: Colors.black.withOpacity(0)),
  ),
};
