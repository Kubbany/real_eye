import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/custom_home_button.dart';
import 'package:real_eye/Features/home/presentation/widgets/detection_title_section.dart';

class FreeTrialSection extends StatelessWidget {
  const FreeTrialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          SizedBox(
            height: 80,
          ),
          CustomHomeButton(),
          DetectionTitleSection(),
        ],
      ),
    );
  }
}
