import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/image_frame.dart';
import 'package:real_eye/core/utils/app_images.dart';

class DeepFakeFrameSection extends StatelessWidget {
  const DeepFakeFrameSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(
        top: 90,
        bottom: 120,
      ),
      child: ImageFrame(
        image: Assets.imagesDeepfake,
      ),
    );
  }
}
