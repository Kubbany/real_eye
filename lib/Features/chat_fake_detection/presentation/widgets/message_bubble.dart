// features/chat/presentation/widgets/message_bubble.dart
import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/prediction_result.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/video_player.dart';

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: message.isUser ? Colors.blue[100] : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildMessageContent(),
            if (message.imagePredictions != null || message.videoPredictions != null)
              PredictionResults(
                imagePredictions: message.imagePredictions,
                videoPredictions: message.videoPredictions,
              ),
            _buildTimestamp(),
          ],
        ),
      ),
    );
  }

  Widget _buildMessageContent() {
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
    }
  }

  Widget _buildTimestamp() {
    return Text(
      '${message.timestamp.hour}:${message.timestamp.minute}',
      style: const TextStyle(fontSize: 10, color: Colors.grey),
    );
  }
}
