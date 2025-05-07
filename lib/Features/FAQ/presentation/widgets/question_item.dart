import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/domain/entities/question_entity.dart';

class QuestionItem extends StatelessWidget {
  const QuestionItem({
    super.key,
    required this.item,
  });
  final QuestionEntity item;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(
        16,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff111111),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Text(
            item.question,
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
