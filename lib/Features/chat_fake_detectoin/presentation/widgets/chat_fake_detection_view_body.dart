import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detectoin/presentation/widgets/media_upload_text_field.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';

class ChatFakeDetectionViewBody extends StatelessWidget {
  const ChatFakeDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        children: [
          CustomGradientHeader(
            title: "Detect Deepfakes",
            titleSize: 40,
          ),
          Expanded(
            child: SizedBox(),
          ),
          MediaUploadTextField(),
        ],
      ),
    );
  }
}
