import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';

class SignUpActions extends StatelessWidget {
  const SignUpActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        TextButton(
          onPressed: () {},
          child: const Text(
            "Have an Account?",
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
