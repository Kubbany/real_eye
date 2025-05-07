import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';

class KnowledgeCenterHeaderSection extends StatelessWidget {
  const KnowledgeCenterHeaderSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      spacing: 15,
      children: <Widget>[
        CustomGradientHeader(
          title: "Knowledge Center",
          titleSize: 39,
        ),
        CustomGradientHeader(
          title: "Real-Life Cases of Deepfake",
          titleSize: 22,
        ),
      ],
    );
  }
}
