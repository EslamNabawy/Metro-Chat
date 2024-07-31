import 'package:flutter/material.dart';

import '../../../Core/Constants/fonts.dart';
import '../../../Core/Theme/app_colors.dart';

enum ButtonSize { small, medium, large }

class CustomButton extends StatelessWidget {
  final ButtonSize size;
  final VoidCallback onPressed;
  final String text;

  const CustomButton({
    super.key,
    required this.size,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    double height;
    double width;

    switch (size) {
      case ButtonSize.small:
        height = 30;
        width = 200;
        break;
      case ButtonSize.medium:
        height = 35;
        width = 250;
        break;
      case ButtonSize.large:
        height = 40;
        width = 300;
        break;
    }

    return Container(
      height: height,
      width: width,
      margin: const EdgeInsets.only(top: 30),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.secondary,
          shape: const RoundedRectangleBorder(),
        ),
        child: Text(
          text,
          style: const TextStyle(
            fontFamily: AppFonts.golden,
            fontSize: 20,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
