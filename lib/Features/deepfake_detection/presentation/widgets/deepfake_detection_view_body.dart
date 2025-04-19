import 'package:flutter/material.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_detection_actions.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_frame.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/titles_section.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/pinned_app_bar.dart';

class DeepfakeDetectionViewBody extends StatelessWidget {
  const DeepfakeDetectionViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            decoration: getGradientDecoration(),
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
        const PinnedAppBar(),
      ],
    );
  }
}
