import 'package:flutter/material.dart';
import 'package:real_eye/Features/FAQ/domain/entities/question_entity.dart';
import 'package:real_eye/Features/FAQ/presentation/widgets/question_item.dart';

class QuestionsListView extends StatelessWidget {
  const QuestionsListView({super.key});
  static const List<QuestionEntity> questions = [
    QuestionEntity(
      question: "What are the dangers of Deepfakes?",
      answer:
          "Deepfakes are AI-generated manipulations of videos, images or audio that appear genuine. They can be used to spread misinformation, manipulate political opinions and even pose threats to national security",
    ),
    QuestionEntity(
      question: "How do Deepfakes spread misinformation?",
      answer:
          "Deepfakes can create highly convincing fake videos or images that may go viral on social media, leading to false narratives, reputation damage, and public deception.",
    ),
    QuestionEntity(
      question: "Can Deepfakes be used for harassment and blackmail?",
      answer:
          "Yes. Deepfakes can be weaponized to create explicit or compromising fake content used to harass or blackmail individuals, leading to severe psychological distress and reputation damage.",
    ),
    QuestionEntity(
      question: "How can victims of deepfake harassment seek help?",
      answer:
          "Victims should report the incident to law enforcement, seek legal counsel, and contact social media platforms to request content removal. Psychological support is also essential in handling emotional distress.",
    ),
    QuestionEntity(
      question: "What legal actions can be taken against deepfake blackmail?",
      answer:
          "Many countries are enacting laws to criminalize deepfake blackmail. Victims can file defamation, privacy violation, or cybercrime charges depending on local regulations.",
    ),
    QuestionEntity(
      question: "Can Deepfakes be used for cyberbullying?",
      answer:
          "Yes. Deepfakes can be misused to create malicious videos or images targeting individuals, leading to harassment, defamation, and psychological harm.",
    ),
    QuestionEntity(
      question: "How do Deepfakes impact political landscapes?",
      answer:
          "Fake videos or manipulated speeches of politicians can be used to sway public opinion, manipulate elections, and undermine democracy.",
    ),
    QuestionEntity(
      question: "Do Deepfakes pose a national security threat?",
      answer:
          "Yes. Manipulated media featuring government officials or military leaders can create confusion, disrupt national security, and impact international relations.",
    ),
    QuestionEntity(
      question: "How can we prevent the spread of Deepfakes?",
      answer:
          "Education, verification systems, and legal frameworks are key. Raising awareness, developing AI detection tools, and enforcing regulations can help mitigate the risks.",
    ),
    QuestionEntity(
      question: "How can individuals protect themselves from deepfake exploitation?",
      answer:
          "Avoid sharing sensitive personal content, enable privacy settings on social media, use digital watermarking for authenticity verification, and stay informed about emerging deepfake detection tools.",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: questions.length,
      itemBuilder: (context, index) => QuestionItem(
        item: questions[index],
      ),
    );
  }
}
