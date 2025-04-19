import 'package:flutter/material.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_detection_view_body.dart';

class DeepfakeDetectionView extends StatelessWidget {
  const DeepfakeDetectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: DeepfakeDetectionViewBody(),
    );
  }
}
