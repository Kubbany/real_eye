import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/presentation/widgets/post_creation_details.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class PostItem extends StatelessWidget {
  final String comment;
  final String timeAgo;

  const PostItem({
    super.key,
    required this.comment,
    this.timeAgo = 'just now',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff111111),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCreationDetails(timeAgo: timeAgo),
            const SizedBox(height: 12),
            Text(
              comment,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                title: "Comment",
                onPressed: () {},
                borderRadius: 64,
                backgroundColor: const Color(0xff183cc5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
