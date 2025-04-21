import 'package:flutter/material.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/auth_header.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/continue_with_section.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/sign_up_actions_sections.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/sign_up_form_section.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

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
                header: "Create an Account",
                subtitle: "Join Us to Detect Deepfake Instantly",
              ),
              SizedBox(
                height: 35,
              ),
              SignUpFormSection(),
              SignUpActionsSection(),
              SizedBox(
                height: 15,
              ),
              ContinueWithSection(
                title: "Sign Up With",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
