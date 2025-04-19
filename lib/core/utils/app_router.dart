import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/about_us/presentation/views/about_us_view.dart';
import 'package:real_eye/Features/authentication/presentation/views/login_view.dart';
import 'package:real_eye/Features/contact_us/presentation/views/contact_us_view.dart';
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
        pageBuilder: (context, state) => slidingNavigation(state, const LoginView()),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => slidingNavigation(state, const HomeView()),
      ),
      GoRoute(
        path: kAboutUsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const AboutUsView(),
        ),
      ),
      GoRoute(
        path: kDeepFakeDetectionView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const DeepfakeDetectionView(),
        ),
      ),
      GoRoute(
        path: kContactUsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const ContactUsView(),
        ),
      ),
    ],
  );

  static CustomTransitionPage<dynamic> slidingNavigation(GoRouterState state, Widget view) {
    return CustomTransitionPage(
      key: state.pageKey,
      child: view,
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
    );
  }
}
