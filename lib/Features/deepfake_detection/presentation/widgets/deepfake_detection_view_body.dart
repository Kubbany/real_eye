import 'package:flutter/material.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_detection_actions.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_frame.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/titles_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_gradient_container.dart';
import 'package:real_eye/core/widgets/preserved_app_bar_margin.dart';

class DeepfakeDetectionViewBody extends StatelessWidget {
  const DeepfakeDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomGradientContainer(
      child: CustomScrollView(
        slivers: [
          PreservedAppBarMargin(),
          SliverToBoxAdapter(
            child: TitlesSection(),
          ),
          SliverToBoxAdapter(
            child: DeepfakeDetectionActions(),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 25),
              child: DeepfakeFrame(
                image: Assets.imagesDeepfake,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
