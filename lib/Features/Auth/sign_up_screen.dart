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

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state.error != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.error!)),
                    );
                  }
                  if (state.user != null) {
                    AppRouter.go(context, AppRoute.home);
                  }
                },
                child: Column(
                  children: [
                    const AuthHeader(),
                    Spaces.large(),
                    const SignUpTitle(
                      title: 'Sign Up',
                    ),
                    Spaces.large(),
                    _UsernameField(),
                    Spaces.medium(),
                    _PasswordField(),
                    Spaces.large(),
                    _SignUpButton(),
                    Spaces.medium(),
                    _buildSignInPrompt(context),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInPrompt(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account? ',
          style: TextStyle(
            fontFamily: AppFonts.retro,
            fontSize: 12,
            color: AppColors.secondary,
          ),
        ),
        GestureDetector(
          onTap: () {
            AppRouter.go(context, AppRoute.signin);
          },
          child: const Text(
            'Sign In',
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
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomFormField(
          controller: TextEditingController(text: state.username)
            ..selection =
                TextSelection.collapsed(offset: state.username.length),
          svgIconPath: 'assets/Icons/username_icon.svg',
          hintText: 'Username',
          onChanged: (value) {
            context.read<AuthCubit>().updateUsername(value);
          },
        );
      },
    );
  }
}

class _PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomFormField(
          controller: TextEditingController(text: state.password)
            ..selection =
                TextSelection.collapsed(offset: state.password.length),
          svgIconPath: 'assets/Icons/password_icon.svg',
          hintText: 'Password',
          isPassword: true,
          onChanged: (value) {
            context.read<AuthCubit>().updatePassword(value);
          },
        );
      },
    );
  }
}

class _SignUpButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return CustomButton(
          size: ButtonSize.large,
          onPressed: state.isLoading
              ? null
              : () {
                  context.read<AuthCubit>().signUp();
                },
          text: state.isLoading ? 'Signing Up...' : 'Sign Up',
        );
      },
    );
  }
}
