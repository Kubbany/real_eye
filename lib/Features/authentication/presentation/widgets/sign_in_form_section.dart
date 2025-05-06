import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const LabeledTextField(
          label: "Email Address",
          hint: "Enter Your Email",
        ),
        const SizedBox(
          height: 20,
        ),
        const LabeledTextField(
          label: "Password",
          isPasswordField: true,
          hint: "Enter Your Password",
        ),
        const SizedBox(
          height: 25,
        ),
        CustomButton(
          title: "Sign In",
          titleSize: 18,
          buttonHeight: 50,
          onPressed: () {
            GoRouter.of(context).go(AppRouter.kChatFakeDetectionView);
          },
          borderRadius: 8,
          backgroundColor: const Color(0xff264cf7),
        ),
      ],
    );
  }
}
