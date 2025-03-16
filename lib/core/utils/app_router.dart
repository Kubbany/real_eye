import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/splash/presentaion/views/splash_view.dart';

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
    ],
  );
}
