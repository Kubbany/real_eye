import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';

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
          TextButton(
            onPressed: () => _viewGradCam(context, prediction.gradcamUrl),
            child: const Text('View GradCAM'),
          ),
        ],
      ),
    );
  }

  void _viewGradCam(BuildContext context, String url) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(title: const Text('GradCAM Visualization')),
          body: Center(
            child: Image.network(url),
          ),
        ),
      ),
    );
  }
}
