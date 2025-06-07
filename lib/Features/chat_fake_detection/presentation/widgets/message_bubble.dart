import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/user_message_container.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: message.isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        UserMessageContainer(message: message),
      ],
    );
  }
}
