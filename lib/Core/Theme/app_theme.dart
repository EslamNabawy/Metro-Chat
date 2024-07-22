import 'package:flutter/material.dart';
import 'package:metro_chat/Core/Theme/text_styles.dart';

import 'app_colors.dart';

class AppTheme
{
  // Light Theme
  static ThemeData light() {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryLight),
      useMaterial3: true,
      textTheme: AppTextStyles.textTheme,
      scaffoldBackgroundColor: AppColors.backgroundLight,
      appBarTheme:
          _appBarTheme(AppColors.textLight, AppColors.appBarBackgroundLight),
      buttonTheme: _buttonTheme(AppColors.buttonBackgroundLight),
      elevatedButtonTheme:
          _elevatedButtonTheme(AppColors.buttonBackgroundLight),
      inputDecorationTheme: _inputDecorationTheme(AppColors.inputFillLight),
    );
  }

  // Common AppBar Theme
  static AppBarTheme _appBarTheme(Color iconColor, [Color? backgroundColor]) {
    return AppBarTheme(
      backgroundColor: backgroundColor ?? Colors.transparent,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(color: iconColor),
      titleTextStyle: TextStyle(
        color: iconColor,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // Common Button Theme
  static ButtonThemeData _buttonTheme(Color buttonColor) {
    return ButtonThemeData(
      buttonColor: buttonColor,
      textTheme: ButtonTextTheme.primary,
    );
  }

  // Common Elevated Button Theme
  static ElevatedButtonThemeData _elevatedButtonTheme(Color buttonColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(buttonColor),
      ),
    );
  }

  // Common Input Decoration Theme
  static InputDecorationTheme _inputDecorationTheme(Color fillColor) {
    return InputDecorationTheme(
      filled: true,
      fillColor: fillColor,
      border: const OutlineInputBorder(),
    );
  }
}
