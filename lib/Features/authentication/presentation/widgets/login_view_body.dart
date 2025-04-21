import 'package:flutter/material.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/auth_header.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/continue_with_section.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/sign_in_actions_section.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/sign_in_form_section.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          width: double.infinity,
          decoration: getGradientDecoration(),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AuthHeaderSection(
                header: "Welcome Back",
                subtitle: "Sign In to Detect Deepfake Instantly",
              ),
              SizedBox(
                height: 35,
              ),
              SignInFormSection(),
              SignInActionsSection(),
              SizedBox(
                height: 15,
              ),
              ContinueWithSection(
                title: "Continue With",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
