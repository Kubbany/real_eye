import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/chat_fake_detection_view_body.dart';

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
