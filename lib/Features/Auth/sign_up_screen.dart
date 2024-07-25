import 'package:flutter/material.dart';

import 'Widgets/auth_header.dart';
import 'Widgets/custom_form_field.dart';
import 'Widgets/sign_up_title.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            AuthHeader(),
            SizedBox(height: 70),
            SizedBox(height: 55),
            SignUpTitle(),
            CustomFormField(),
          ],
        ),
      ),
    );
  }
}
