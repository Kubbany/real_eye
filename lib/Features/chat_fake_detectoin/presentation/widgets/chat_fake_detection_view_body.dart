import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/chat_list_view.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/media_upload_text_field.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';
import 'package:real_eye/core/widgets/user_app_bar.dart';

class ChatFakeDetectionViewBody extends StatelessWidget {
  const ChatFakeDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        UserAppBar(),
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 20,
            ),
            child: Column(
              children: <Widget>[
                CustomGradientHeader(
                  title: "Detect Deepfakes",
                  titleSize: 40,
                ),
                Expanded(
                  child: ChatListView(),
                ),
                MediaUploadTextField(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
