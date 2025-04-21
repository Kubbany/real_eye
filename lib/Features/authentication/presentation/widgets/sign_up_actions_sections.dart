import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';

class SignUpActionsSection extends StatelessWidget {
  const SignUpActionsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Already Have an Account?",
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
        TextButton(
          onPressed: () {
            GoRouter.of(context).go(
              AppRouter.kLoginView,
            );
          },
          child: const Text(
            "Sign In",
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
