import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metro_chat/Core/Constants/fonts.dart';
import 'package:metro_chat/Core/Theme/app_colors.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Container(
        width: 300,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primary,
            width: 1.0,
          ),
        ),
        child: Row(
          children: [
            SizedBox(
              width: 40,
              child: Center(
                child: SvgPicture.asset(
                  'assets/Icons/username_icon.svg',
                  width: 20,
                  height: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
              child: VerticalDivider(
                color: AppColors.primary,
                thickness: 1,
                width: 1,
              ),
            ),
            Expanded(
              child: TextFormField(
                enableIMEPersonalizedLearning: true,
                maxLength: 15,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: const TextStyle(
                  fontFamily: AppFonts.pixellari,
                  fontSize: 14,
                  color: AppColors.secondary,
                ),
                decoration: InputDecoration(
                  hintText: '',
                  hintStyle: TextStyle(
                    fontFamily: AppFonts.pixellari,
                    fontSize: 14,
                    color: AppColors.secondary.withOpacity(0.3),
                    letterSpacing: 2,
                  ),
                  fillColor: Colors.transparent,
                  filled: true,
                  counterText: '',
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  isDense: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
