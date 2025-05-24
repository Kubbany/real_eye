import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comments_section.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comments_view_post_section.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
import 'package:real_eye/core/widgets/custom_text_field.dart';

class CommentsViewBody extends StatelessWidget {
  const CommentsViewBody({super.key, required this.post});
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 22,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(
            height: 30,
          ),
          CommentViewPostSection(
            post: post,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            hintText: "Write a comment...",
            verticalContentPadding: 90,
            fillColor: const Color(0xff111111),
            borderColor: Colors.grey[600],
            borderRadius: 10,
            validator: AppValidators.requiredField,
          ),
          const SizedBox(height: 16),
          CustomButton(
            title: "Comment",
            titleSize: 18,
            onPressed: () {},
            borderRadius: 8,
            backgroundColor: const Color(0xff183dc9),
            buttonHeight: 50,
          ),
          const SizedBox(
            height: 16,
          ),
          const Expanded(
            child: CommentsSection(),
          ),
        ],
      ),
    );
  }
}
