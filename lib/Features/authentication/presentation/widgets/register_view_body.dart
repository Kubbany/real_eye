import 'package:flutter/material.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/continue_with_list.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/sign_up_actions.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
          ),
          width: double.infinity,
          decoration: getGradientDecoration(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Create an Account",
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Join Us to Detect Deepfake Instantly",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              const LabeledTextField(
                label: "Username",
                hint: "Enter Your Username",
              ),
              const SizedBox(
                height: 20,
              ),
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
                height: 20,
              ),
              const LabeledTextField(
                label: "Confirm Password",
                isPasswordField: true,
                hint: "Confirm Your Password",
              ),
              const SizedBox(
                height: 25,
              ),
              CustomButton(
                title: "Sign Up",
                titleSize: 18,
                buttonHeight: 50,
                onPressed: () {},
                borderRadius: 8,
                backgroundColor: const Color(0xff264cf7),
              ),
              const SignUpActions(),
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Sign Up With",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const ContinueWithList(),
            ],
          ),
        ),
      ),
    );
  }
}
