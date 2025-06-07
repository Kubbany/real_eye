import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/message_content.dart';

class UserMessageContainer extends StatelessWidget {
  final ChatMessage message;

  const UserMessageContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: MessageContent(message: message),
    );
  }
}
