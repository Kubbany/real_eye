import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/message_bubble.dart';

class VideoPredictionItem extends StatelessWidget {
  final VideoPredictionEntity prediction;

  const VideoPredictionItem({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Model: ${prediction.model}'),
          if (prediction.fakePercentage != null) Text('Fake: ${prediction.fakePercentage?.toStringAsFixed(1)}%'),
          if (prediction.realPercentage != null) Text('Real: ${prediction.realPercentage?.toStringAsFixed(1)}%'),
          if (prediction.fakeFramesCount != null) Text('Fake Frames: ${prediction.fakeFramesCount}'),
          if (prediction.fakeFramesZip != null)
            ClickableUrlText(url: prediction.fakeFramesZip!, prefixText: 'Fake Frames Zip: '),
        ],
      ),
    );
  }
}
