import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/domain/entities/how_it_work_entity.dart';
import 'package:real_eye/Features/about/presentation/widgets/how_it_works_item.dart';

class HowItWorksList extends StatelessWidget {
  const HowItWorksList({super.key});
  static const List<HowItWorkEntity> steps = [
    HowItWorkEntity(title: "1. Upload", subtitle: "Upload an image or provie a link to the media you want to analyze."),
    HowItWorkEntity(
        title: "2. AI Analysis", subtitle: "Our AI scans for pixel inconsistencies, metadata and deepfake markers."),
    HowItWorkEntity(
        title: "3. Get Results", subtitle: "Receive an instant deepfake detection report with authenticity scores."),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        steps.length,
        (e) => HowItWorksItem(
          item: steps[e],
        ),
      ),
    );
  }
}
