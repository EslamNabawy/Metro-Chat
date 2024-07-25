import 'package:flutter/cupertino.dart';

import '../../../Core/Constants/fonts.dart';
import '../../../Core/Theme/app_colors.dart';

class SignUpTitle extends StatelessWidget {
  const SignUpTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 50, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: AppFonts.golden,
              fontSize: 20,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
