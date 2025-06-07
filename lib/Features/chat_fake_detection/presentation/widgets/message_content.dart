import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/prediction_response.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/video_player.dart';

class MessageContent extends StatelessWidget {
  final ChatMessage message;

  const MessageContent({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    switch (message.type) {
      case MessageType.text:
        return Text(message.content ?? '');
      case MessageType.image:
        return message.file != null ? Image.file(message.file!, height: 150) : const SizedBox();
      case MessageType.video:
        return message.file != null
            ? SizedBox(
                height: 150,
                child: VideoPlayerWidget(file: message.file!),
              )
            : const SizedBox();
      case MessageType.imageUrl:
        return message.url != null ? Image.network(message.url!, height: 150) : const SizedBox();
      case MessageType.predictionResult:
        return PredictionResponseContainer(message: message);
    }
  }
}
