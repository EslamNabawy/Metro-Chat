import 'package:flutter/material.dart';

import '../../Core/Constants/fonts.dart';
import '../../Core/Theme/app_colors.dart';
import 'Widgets/auth_header.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/custom_form_field.dart';
import 'Widgets/sign_up_title.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  SignupScreenState createState() => SignupScreenState();
}

class SignupScreenState extends State<SignupScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeader(),
            const SizedBox(height: 70),
            const SignUpTitle(),
            const SizedBox(height: 70),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 55, bottom: 5),
                  child: Text(
                    'User Name',
                    style: TextStyle(
                      fontFamily: AppFonts.retro,
                      fontSize: 13,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            CustomFormField(
              controller: usernameController,
              svgIconPath: 'assets/Icons/username_icon.svg',
              isPassword: false,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 55, bottom: 5),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontFamily: AppFonts.retro,
                      fontSize: 13,
                      color: AppColors.secondary,
                    ),
                  ),
                ),
              ],
            ),
            CustomFormField(
              controller: passwordController,
              svgIconPath: 'assets/Icons/password_icon.svg',
              isPassword: true,
              validator: (value) {
                if (value == null || value.length < 6) {
                  return 'Password must be at least 6 characters';
                }
                return null;
              },
            ),
            CustomButton(
              size: ButtonSize.large,
              onPressed: () {},
              text: 'Sign Up',
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'No account ?? No problem, ',
                  style: TextStyle(
                    fontFamily: AppFonts.retro,
                    fontSize: 12,
                    color: AppColors.secondary,
                  ),
                ),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontFamily: AppFonts.golden,
                    fontSize: 14,
                    color: AppColors.secondary,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



