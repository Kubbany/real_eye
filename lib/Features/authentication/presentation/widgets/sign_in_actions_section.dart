import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';

class SignInActionsSection extends StatelessWidget {
  const SignInActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text(
            "Forgot Password?",
            textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).go(
              AppRouter.kRegisterView,
            );
          },
          child: const Text(
            "Create Account",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
