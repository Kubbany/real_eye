import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/user_avatar.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
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
            _buildDrawerButton('Detect Deepfakes', () {}),
            _buildDrawerButton('Knowledge Center', () {}),
            _buildDrawerButton('FAQ', () {}),
            const Spacer(),
            const CustomLogoutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerButton(String title, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: CustomButton(
        title: title,
        titleSize: 18,
        onPressed: onPressed,
        borderRadius: 8,
        backgroundColor: const Color(0xff303030),
        buttonHeight: 50,
      ),
    );
  }
}
