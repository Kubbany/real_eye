import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/FAQ/presentation/views/faq_view.dart';
import 'package:real_eye/Features/about_us/presentation/views/about_us_view.dart';
import 'package:real_eye/Features/authentication/presentation/views/login_view.dart';
import 'package:real_eye/Features/authentication/presentation/views/register_view.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/views/chat_fake_detection_view.dart';
import 'package:real_eye/Features/contact_us/presentation/views/contact_us_view.dart';
import 'package:real_eye/Features/create_post/presentation/views/create_post_view.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/views/deepfake_detection_view.dart';
import 'package:real_eye/Features/knowledge_center/presentation/views/knowledge_center_view.dart';
import 'package:real_eye/Features/posts/presentation/views/comments_view.dart';
import 'package:real_eye/Features/posts/presentation/views/posts_view.dart';
import 'package:real_eye/Features/profile/presentation/views/profile_comments_view.dart';
import 'package:real_eye/Features/profile/presentation/views/profile_posts_view.dart';
import 'package:real_eye/Features/splash/presentation/views/splash_view.dart';
import 'package:real_eye/features/home/presentation/views/home_view.dart';

abstract class AppRouter {
  static const kLoginView = "/loginView";
  static const kRegisterView = "/registerView";
  static const kHomeView = "/homeView";
  static const kDeepFakeDetectionView = "/deepFakeDetectionView";
  static const kChatFakeDetectionView = "/chatFakeDetectionView";
  static const kAboutUsView = "/aboutUsView";
  static const kContactUsView = "/contactUsView";
  static const kKnowledgeCenterView = "/knowledgeCenterView";
  static const kFAQView = "/fAQView";
  static const kCreatePostView = "/createPostView";
  static const kPostsView = "/postsView";
  static const kProfilePostsView = "/profilePostsView";
  static const kCommentsView = "/commentsView";
  static const kProfileCommentsView = "/profileCommentsView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: kLoginView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const LoginView(),
        ),
      ),
      GoRoute(
        path: kRegisterView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const RegisterView(),
        ),
      ),
      GoRoute(
        path: kHomeView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const HomeView(),
        ),
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
        path: kChatFakeDetectionView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const ChatFakeDetectionView(),
        ),
      ),
      GoRoute(
        path: kContactUsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const ContactUsView(),
        ),
      ),
      GoRoute(
        path: kKnowledgeCenterView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const KnowledgeCenterView(),
        ),
      ),
      GoRoute(
        path: kFAQView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const FAQView(),
        ),
      ),
      GoRoute(
        path: kCreatePostView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const CreatePostView(),
        ),
      ),
      GoRoute(
        path: kPostsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const PostsView(),
        ),
      ),
      GoRoute(
        path: kProfilePostsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const ProfilePostsView(),
        ),
      ),
      GoRoute(
        path: kCommentsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const CommentsView(),
        ),
      ),
      GoRoute(
        path: kProfileCommentsView,
        pageBuilder: (context, state) => slidingNavigation(
          state,
          const ProfileCommentsView(),
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
