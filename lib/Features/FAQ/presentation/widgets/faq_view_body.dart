import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/domain/entities/question_entity.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/question_item.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';

class FAQViewBody extends StatelessWidget {
  const FAQViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 20,
      ),
      child: Column(
        children: <Widget>[
          CustomGradientHeader(
            title: "Frequently Asked Questions",
            titleSize: 25,
          ),
          SizedBox(
            height: 25,
          ),
          QuestionItem(
            item: QuestionEntity(
              question: "What are the dangers of Deepfakes?",
              answer:
                  "Deepfake are AI-generated manipulations of videos, images or audio that appear genuine. They can be used to spread misinformation, manipulate political opinions and even pose threats to national security",
            ),
          ),
        ],
      ),
    );
  }
}
