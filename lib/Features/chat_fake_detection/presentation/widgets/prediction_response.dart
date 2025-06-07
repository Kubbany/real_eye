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
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Analysis Results:', style: TextStyle(fontWeight: FontWeight.bold)),
          if (message.imagePredictions != null)
            ...List.generate(
              message.imagePredictions!.length * 2 - 1,
              (index) => index.isEven
                  ? ImagePredictionItem(prediction: message.imagePredictions![index ~/ 2])
                  : Divider(height: 3, color: Colors.grey[700]),
            ),
          if (message.videoPredictions != null)
            ...List.generate(
              message.videoPredictions!.length * 2 - 1,
              (index) => index.isEven
                  ? VideoPredictionItem(prediction: message.videoPredictions![index ~/ 2])
                  : Divider(height: 3, color: Colors.grey[700]),
            ),
        ],
      ),
    );
  }
}
