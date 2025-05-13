import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/user_avatar.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_drawer_button.dart';
import 'package:real_eye/core/widgets/custom_logout_button.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xff111111),
      child: SafeArea(
        child: Column(
          children: [
            const UserAvatar(),
            const SizedBox(height: 10),
            const Text(
              'ahmed15',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            const Text(
              'ahmed@gmail.com',
              style: TextStyle(color: Color(0xfff4f2f3), fontSize: 18),
            ),
            const SizedBox(height: 20),
            const Divider(color: Colors.grey, thickness: 3),
            const SizedBox(height: 20),
            CustomDrawerButton(
              title: 'Detect Deepfakes',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kChatFakeDetectionView);
              },
            ),
            CustomDrawerButton(
              title: 'Knowledge Center',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kKnowledgeCenterView);
              },
            ),
            CustomDrawerButton(
              title: 'FAQ',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kFAQView);
              },
            ),
            CustomDrawerButton(
              title: 'Posts',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kPostsView);
              },
            ),
            CustomDrawerButton(
              title: 'Create Post',
              onPressed: () {
                GoRouter.of(context).go(AppRouter.kCreatePostView);
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
