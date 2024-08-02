import 'package:flutter/material.dart';

import '../../../Core/Constants/fonts.dart';
import '../../../Core/Theme/app_colors.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
    this.title = 'Sign Up',
    this.fontSize = 20,
    this.padding = const EdgeInsets.only(left: 10, right: 20),
  });

  final String title;
  final double fontSize;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: AppFonts.golden,
              fontSize: fontSize,
              color: AppColors.secondary,
            ),
          ),
        ],
      ),
    );
  }
}
