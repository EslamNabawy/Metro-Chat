import 'package:flutter/material.dart';
import 'package:metro_chat/Core/Theme/app_colors.dart';

import '../Constants/fonts.dart';

class AppTextStyles {
  static const TextStyle monoton = TextStyle(
    fontFamily: AppFonts.monoton,
  );

  static const TextStyle golden = TextStyle(
    fontFamily: AppFonts.golden,
  );

  static const TextStyle pixellari = TextStyle(
    fontFamily: AppFonts.pixellari,
  );

  static const TextStyle retro = TextStyle(
    fontFamily: AppFonts.retro,
  );

  static TextTheme textTheme = TextTheme(
    bodyLarge: golden.copyWith(fontSize: 20, color: AppColors.primary),
    bodyMedium: pixellari.copyWith(fontSize: 18, color: AppColors.primary),
    bodySmall: retro.copyWith(fontSize: 16, color: AppColors.primary),
    displayLarge: monoton.copyWith(fontSize: 45, color: AppColors.primary),
    displayMedium: pixellari.copyWith(fontSize: 15, color: AppColors.secondary),
    // Add more styles as needed
  );
}
