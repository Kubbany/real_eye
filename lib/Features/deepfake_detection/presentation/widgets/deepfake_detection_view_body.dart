import 'package:flutter/material.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_detection_actions.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_frame.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/titles_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class DeepfakeDetectionViewBody extends StatelessWidget {
  const DeepfakeDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.black,
                  Colors.grey.shade900,
                  Colors.black,
                ],
              ),
            ),
            child: const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 85,
                  ), // Reserve space for AppBar!
                ),
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
          ),
        ),
        const Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: CustomAppBar(),
        ),
      ],
    );
  }
}
