// features/chat/presentation/widgets/prediction_results.dart
import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/gradcam_viewer.dart';

class PredictionResults extends StatelessWidget {
  final List<ImagePredictionEntity>? imagePredictions;
  final List<VideoPredictionEntity>? videoPredictions;

  const PredictionResults({
    super.key,
    this.imagePredictions,
    this.videoPredictions,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 8),
        const Text('Detection Results:', style: TextStyle(fontWeight: FontWeight.bold)),
        if (imagePredictions != null) ..._buildImagePredictions(context, imagePredictions!),
        if (videoPredictions != null) ..._buildVideoPredictions(videoPredictions!),
      ],
    );
  }

  List<Widget> _buildImagePredictions(context, List<ImagePredictionEntity> predictions) {
    return predictions
        .map((prediction) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Model: ${prediction.model}'),
                Text('Prediction: ${prediction.prediction}'),
                Text('Confidence: ${prediction.confidence}'),
                TextButton(
                  onPressed: () => _viewGradCam(context, prediction.gradcamUrl),
                  child: const Text('View GradCAM'),
                ),
                const Divider(height: 8),
              ],
            ))
        .toList();
  }

  List<Widget> _buildVideoPredictions(List<VideoPredictionEntity> predictions) {
    return predictions
        .map((prediction) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Model: ${prediction.model}'),
                Text('Fake: ${prediction.fakePercentage.toStringAsFixed(2)}%'),
                Text('Real: ${prediction.realPercentage.toStringAsFixed(2)}%'),
                Text('Fake Frames: ${prediction.fakeFramesCount}'),
                const Divider(height: 8),
              ],
            ))
        .toList();
  }

  void _viewGradCam(context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => GradCamView(imageUrl: url)));
  }
}
