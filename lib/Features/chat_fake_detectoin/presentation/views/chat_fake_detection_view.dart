import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/chat_fake_detection_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class ChatFakeDetectionView extends StatelessWidget {
  const ChatFakeDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: ChatFakeDetectionViewBody(),
    );
  }
}
