import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/clickable_url_text.dart';
import 'package:real_eye/core/utils/methods/fix_url.dart';

class ImagePredictionItem extends StatelessWidget {
  final ImagePredictionEntity prediction;

  const ImagePredictionItem({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Model: ${prediction.model}'),
          Text('Prediction: ${prediction.prediction}'),
          Text('Confidence: ${prediction.confidence}'),
          ClickableUrlText(
            prefixText: "Gradcam URL: ",
            url: fixLocalhostUrl(prediction.gradcamUrl),
          ),
        ],
      ),
    );
  }
}
