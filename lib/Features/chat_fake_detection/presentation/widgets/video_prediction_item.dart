import 'package:flutter/material.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/presentation/widgets/clickable_url_text.dart';
import 'package:real_eye/core/utils/methods/fix_url.dart';

class VideoPredictionItem extends StatelessWidget {
  final VideoPredictionEntity prediction;

  const VideoPredictionItem({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Model: ${prediction.model}'),
          if (prediction.fakeFramesCount != null) Text('Fake Frames Count: ${prediction.fakeFramesCount}'),
          if (prediction.fakeFramesZip != null)
            ClickableUrlText(url: fixLocalhostUrl(prediction.fakeFramesZip!), prefixText: 'Fake Frames Zip: '),
          if (prediction.fakePercentage != null)
            Text('Fake Percentage: ${prediction.fakePercentage?.toStringAsFixed(1)}%'),
          if (prediction.realPercentage != null)
            Text('Real Percentage: ${prediction.realPercentage?.toStringAsFixed(1)}%'),
          if (prediction.totalFramesAnalyzed != null)
            Text('Total Frames Analyzed: ${prediction.totalFramesAnalyzed?.toStringAsFixed(1)}%'),
          if (prediction.model == "Common")
            Text('Common Fake Frames Count: ${prediction.commonFakeFramesCount?.toStringAsFixed(1)}%'),
          if (prediction.model == "Common")
            ClickableUrlText(
                url: fixLocalhostUrl(prediction.commonFakeFramesZip!), prefixText: 'Common Fake Frames Zip: '),
        ],
      ),
    );
  }
}
