import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/message_model.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/image_prediction_item.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/video_prediction_item.dart';

class PredictionResponseContainer extends StatelessWidget {
  final ChatMessage message;

  const PredictionResponseContainer({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      decoration: BoxDecoration(
        color: Colors.grey[700],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Analysis Results:', style: TextStyle(fontWeight: FontWeight.bold)),
          if (message.imagePredictions != null)
            ...message.imagePredictions!.map((prediction) => ImagePredictionItem(prediction: prediction)),
          if (message.videoPredictions != null)
            ...message.videoPredictions!.map((prediction) => VideoPredictionItem(prediction: prediction)),
        ],
      ),
    );
  }
}
