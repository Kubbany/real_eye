import 'package:flutter/material.dart';
import 'package:real_eye/Features/knowledge_center/domain/entites/deepfake_case_entity.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/deepfake_cases_card.dart';
import 'package:real_eye/core/utils/app_images.dart';

class DeepfakeCasesListView extends StatelessWidget {
  const DeepfakeCasesListView({super.key});
  static const List<DeepfakeCaseEntity> cases = [
    DeepfakeCaseEntity(
      image: Assets.imagesCase1,
      title: 'Elliston Berry: AI-Generated Deepfake Harassment',
      details: 'At just 14 years old, Elliston Berry became a victim of AI-generated deepfake nude images. '
          'These fabricated images, created from her social media photos, were circulated by classmates, '
          'causing severe emotional trauma.',
    ),
    DeepfakeCaseEntity(
      image: Assets.imagesCase2,
      title: 'Hyderabad Deepfake Blackmail Incident',
      details:
          'A 19-year-old student from Hyderabad, India, was blackmailed using deepfake technology. The accused used AI to create a nude deepfake image and attempted to extort money from the victim',
    ),
    DeepfakeCaseEntity(
      image: Assets.imagesCase3,
      title: 'Singapore Public Servants Targeted by Deepfake Extortion',
      details:
          'Over 100 public servants in Singapore, including five ministers, were targeted in a deepfake extortion scheme. AI-generated compromising content was used to blackmail officials, highlighting the growing cyber threat.',
    ),
    DeepfakeCaseEntity(
      image: Assets.imagesCase4,
      title: "UK Soldier's Deepfake Revenge Blackmail",
      details:
          "Jonathan Bates, a former Royal Air Force veteran, was sentenced to five years in prison for creating and distributing sexually explicit deepfake images of his ex-wife and three other women.",
    ),
    DeepfakeCaseEntity(
      image: Assets.imagesCase5,
      title: "South Korea's Deepfake Telegram Scandal",
      details:
          'In South Korea, numerous teachers and female students became victims of deepfake images shared on Telegram. This incident sparked national outrage and prompted calls for stronger legal actions',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: cases.length,
      itemBuilder: (context, index) => DeepfakeCaseCard(
        deepFakeCase: cases[index],
      ),
    );
  }
}
