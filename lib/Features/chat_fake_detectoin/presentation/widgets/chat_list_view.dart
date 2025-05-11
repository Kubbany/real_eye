import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/uploaded_media_item.dart';
import 'package:real_eye/core/utils/app_images.dart';

class ChatListView extends StatelessWidget {
  const ChatListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) => const UploadedMediaItem(imageUrl: Assets.imagesFahd),
    );
  }
}
