import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/about/presentation/views/about_us_view.dart';
import 'package:real_eye/Features/authentication/presentation/views/login_view.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/views/deepfake_detection_view.dart';
import 'package:real_eye/Features/splash/presentaion/views/splash_view.dart';
import 'package:real_eye/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kLoginView = "/loginView";
  static const kRegisterView = "/registerView";
  static const kHomeView = "/homeView";
  static const kDeepFakeDetectionView = "/deepFakeDetectionView";
  static const kAboutUsView = "/aboutUsView";
  static const kContactUsView = "/contactUsView";
  static const kDetectDeepFakeView = "/detectDeepFakeView";
  static const kKnowledgeCenterView = "/knowledgeCenterView";
  static const kFAQView = "/fAQView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const LoginView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from bottom
            const end = Offset.zero; // End at normal position
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const HomeView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from bottom
            const end = Offset.zero; // End at normal position
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kAboutUsView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const AboutUsView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from bottom
            const end = Offset.zero; // End at normal position
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
      GoRoute(
        path: kDeepFakeDetectionView,
        pageBuilder: (context, state) => CustomTransitionPage(
          key: state.pageKey,
          child: const DeepfakeDetectionView(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Start from bottom
            const end = Offset.zero; // End at normal position
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        ),
      ),
    ],
  );
}
