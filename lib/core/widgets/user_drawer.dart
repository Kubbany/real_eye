import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/user_avatar.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_drawer_button.dart';
import 'package:real_eye/core/widgets/custom_logout_button.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff111111),
      child: SafeArea(
        child: Column(
          children: [
            const UserAvatar(),
            const SizedBox(height: 10),
            Text(
              user.username,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              user.email,
              style: const TextStyle(color: Color(0xfff4f2f3), fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 3),
            const SizedBox(height: 20),
            CustomDrawerButton(
              title: 'Profile',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kProfilePostsView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'Detect Deepfakes',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kChatFakeDetectionView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'Knowledge Center',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kKnowledgeCenterView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'FAQ',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kFAQView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'Posts',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kPostsView, extra: user);
              },
            ),
            CustomDrawerButton(
              title: 'Create Post',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kCreatePostView, extra: user);
              },
            ),
            const Spacer(),
            const CustomLogoutButton(),
          ],
        ),
      ),
    );
  }
}
