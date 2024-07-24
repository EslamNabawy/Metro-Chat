import 'package:flutter/material.dart';

class AppColors {
  // Custom Colors
  static const Color primary = Color(0xFFD7A839);
  static const Color secondary = Color(0xFFB07E07);
  static const Color background = Color(0xFF242424);
  static const Color text =
      Colors.white; // Assuming you want white text on a dark background

  // Light Theme Colors
  static const Color primaryLight = primary;
  static const Color backgroundLight = background;
  static const Color textLight = text;
  static const Color appBarBackgroundLight = Colors.transparent;
  static const Color buttonBackgroundLight = primary;
  static const Color inputFillLight =
      Color(0xFF333333); // Darker background for inputs
  static const Color cardBackgroundLight =
      Color(0xFF333333); // Darker background for cards
  static const Color cardShadowLight = Colors.black12;
}
