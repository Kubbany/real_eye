import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/user_message_container.dart';
import 'package:real_eye/core/utils/methods/luanch_custom_url.dart';

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

class ClickableUrlText extends StatelessWidget {
  final String url;
  final String? prefixText;

  const ClickableUrlText({
    super.key,
    required this.url,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (prefixText != null) TextSpan(text: prefixText),
          TextSpan(
            text: Uri.parse(url).host,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => luanchCustomUrl(context, url),
          ),
        ],
      ),
    );
  }
}
