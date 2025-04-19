import 'package:flutter/material.dart';
import 'package:real_eye/Features/deepfake_detection/presentation/widgets/deepfake_descriptions.dart';
import 'package:real_eye/core/widgets/gradient_about_us_header.dart';

class TitlesSection extends StatelessWidget {
  const TitlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 60,
          ),
          GradientHeader(
            title: "Deepfake Detection",
            giveHeight: true,
          ),
          SizedBox(
            height: 20,
          ),
          DeepfakeDescriptions(),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }
}
