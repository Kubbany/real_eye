import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';

void navigateToLogin(BuildContext context) {
  GoRouter.of(context).push(
    AppRouter.kLoginView,
  );
}
