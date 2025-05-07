import 'package:flutter/material.dart';
import 'package:real_eye/Features/knowledge_center/domain/entites/deepfake_case_entity.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/knowledge_center_case_card.dart';
import 'package:real_eye/Features/knowledge_center/presentation/widgets/knowledge_center_header_image.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class DeepfakeCaseCard extends StatelessWidget {
  final DeepfakeCaseEntity deepFakeCase;

  const DeepfakeCaseCard({
    super.key,
    required this.deepFakeCase,
  });

  @override
  Widget build(BuildContext context) {
    return KnowledgeCenterCaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          KnowledgeCenterHeaderImage(image: deepFakeCase.image),
          const SizedBox(
            height: 5,
          ),
          CustomButton(
            title: "Read More",
            onPressed: () {},
            borderRadius: 12,
            backgroundColor: const Color(0xff183ccb),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            deepFakeCase.title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 12),
          // Details
          Text(
            deepFakeCase.details,
            style: const TextStyle(
              fontSize: 15,
              color: Colors.grey,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
