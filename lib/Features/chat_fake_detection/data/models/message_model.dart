// features/chat/data/models/chat_message.dart
import 'dart:io';

import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';

enum MessageType { text, image, video, imageUrl }

class ChatMessage {
  final String id;
  final MessageType type;
  final String? content; // For text messages
  final File? file; // For image/video files
  final String? url; // For image URLs
  final DateTime timestamp;
  final bool isUser;
  final List<ImagePredictionEntity>? imagePredictions;
  final List<VideoPredictionEntity>? videoPredictions;

  ChatMessage({
    required this.id,
    required this.type,
    this.content,
    this.file,
    this.url,
    required this.timestamp,
    required this.isUser,
    this.imagePredictions,
    this.videoPredictions,
  });
}
