import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Core/Constants/fonts.dart';
import '../../Core/Routing/app_router.dart';
import '../../Core/Theme/app_colors.dart';
import 'Cubit/sign_in_cubit.dart';
import 'Widgets/auth_header.dart';
import 'Widgets/custom_button.dart';
import 'Widgets/custom_form_field.dart';
import 'Widgets/sign_up_title.dart';
import 'Widgets/spaces.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const AuthHeader(),
                  Spaces.large(),
                  const SignUpTitle(
                    title: 'Sign In', // Updated title to match context
                  ),
                  Spaces.large(),
                  _UsernameField(),
                  Spaces.medium(),
                  _PasswordField(),
                  Spaces.large(),
                  _SignInButton(),
                  Spaces.medium(),
                  _buildSignUpPrompt(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'No account? ',
          style: TextStyle(
            fontFamily: AppFonts.retro,
            fontSize: 12,
            color: AppColors.secondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            AppRouter.go(context, AppRoute.signup);
          },
          child: const Text(
            'Sign Up',
            style: TextStyle(
              fontFamily: AppFonts.golden,
              fontSize: 14,
              color: AppColors.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class _UsernameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return _buildFormField(
          label: 'User Name',
          controller: TextEditingController(text: state.username)
            ..selection =
                TextSelection.collapsed(offset: state.username.length),
          iconPath: 'assets/Icons/username_icon.svg',
          onChanged: (value) {
            context.read<SignInCubit>().updateUsername(value);
          },
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInCubit, SignInState>(
      builder: (context, state) {
        return _buildFormField(
          label: 'Password',
          controller: TextEditingController(text: state.password)
            ..selection =
                TextSelection.collapsed(offset: state.password.length),
          iconPath: 'assets/Icons/password_icon.svg',
          isPassword: true,
          onChanged: (value) {
            context.read<SignInCubit>().updatePassword(value);
          },
        );
      },
    );
  }
}

class _SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomButton(
      size: ButtonSize.large,
      onPressed: () {
        context.read<SignInCubit>().signIn();
      },
      text: 'Sign In',
    );
  }
}

Widget _buildFormField({
  required String label,
  required TextEditingController controller,
  required String iconPath,
  bool isPassword = false,
  required Function(String) onChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontFamily: AppFonts.retro,
          fontSize: 13,
          color: AppColors.secondary,
        ),
      ),
      const SizedBox(height: 8),
      CustomFormField(
        controller: controller,
        svgIconPath: iconPath,
        isPassword: isPassword,
        onChanged: onChanged,
      ),
    ],
  );
}
