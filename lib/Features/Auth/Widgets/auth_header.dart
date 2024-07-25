import 'package:flutter/material.dart';

import '../../../Core/Constants/fonts.dart';
import '../../../Core/Theme/app_colors.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 125),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text('Metro Chat',
                      style: TextStyle(
                          fontFamily: AppFontsE.fonts[FontFamily.monoton],
                          fontSize: 35,
                          color: AppColors.primary)),
                  const SizedBox(height: 10),
                  Text('Fast, Secure, and Retro Cool',
                      style: TextStyle(
                          fontFamily: AppFontsE.fonts[FontFamily.golden],
                          fontSize: 13,
                          color: AppColors.secondary)),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
