import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:map_assignment/src/core/core.dart';

class Themes {
  const Themes._internal();

  static const primaryColor = Color.fromARGB(255, 2, 189, 15);
  static const secondaryColor = Color.fromARGB(255, 244, 120, 3);

  static ThemeData lightTheme = _createTheme(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.light,
    ),
    brightness: Brightness.light,
  );
  static ThemeData darkTheme = _createTheme(
    colorScheme: ColorScheme.fromSeed(
      seedColor: primaryColor,
      secondary: secondaryColor,
      brightness: Brightness.dark,
    ),
    brightness: Brightness.dark,
  );

  static ThemeData _createTheme({
    required ColorScheme colorScheme,
    required Brightness brightness,
  }) {
    return ThemeData(
      brightness: brightness,
      colorScheme: colorScheme,
      useMaterial3: true,
      scaffoldBackgroundColor: colorScheme.secondaryContainer,
      textTheme: GoogleFonts.robotoTextTheme().apply(
        displayColor: colorScheme.onSecondaryContainer,
        bodyColor: colorScheme.onSecondaryContainer,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0.0,
        scrolledUnderElevation: 0.0,
        titleSpacing: 4,
        color: colorScheme.primaryContainer,
        centerTitle: true,
      ),
      cardTheme: const CardTheme(shape: kRoundedRectangleBorder28),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(style: ButtonStyle(
        side: WidgetStateProperty.resolveWith((state) {
          if (state.contains(WidgetState.disabled)) {
            return const BorderSide(color: Colors.grey);
          }
          return BorderSide(color: colorScheme.primary);
        }),
      )),
    );
  }
}
