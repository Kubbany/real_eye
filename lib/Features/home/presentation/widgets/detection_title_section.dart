import 'package:flutter/material.dart';

class DetectionTitleSection extends StatelessWidget {
  const DetectionTitleSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(
        context,
      ).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 28,
          ),
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Opacity(
            opacity: 1.0,
            child: Text(
              "Detect Deepfakes",
              textAlign: TextAlign.center,
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Text(
              "Instantly With Real",
              textAlign: TextAlign.center,
            ),
          ),
          Opacity(
            opacity: 0.6,
            child: Text(
              "Eye",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
