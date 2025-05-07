import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/domain/entities/question_entity.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/faq_card.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.item,
  });
  final QuestionEntity item;
  @override
  Widget build(BuildContext context) {
    return FAQCard(
      child: Column(
        children: <Widget>[
          Text(
            item.question,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            item.answer,
            style: TextStyle(
              color: Colors.grey[300],
            ),
          ),
        ],
      ),
    );
  }
}
