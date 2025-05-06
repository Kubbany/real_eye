import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/chat_fake_detection_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class ChatFakeDetectionView extends StatefulWidget {
  const ChatFakeDetectionView({super.key});

  @override
  State<ChatFakeDetectionView> createState() => _ChatFakeDetectionViewState();
}

class _ChatFakeDetectionViewState extends State<ChatFakeDetectionView> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const UserDrawer(),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            scaffoldKey.currentState!.openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            size: 30,
          ),
        ),
      ),
      body: const ChatFakeDetectionViewBody(),
    );
  }
}
