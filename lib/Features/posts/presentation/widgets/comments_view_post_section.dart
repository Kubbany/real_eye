import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';

class CommentViewPostSection extends StatelessWidget {
  const CommentViewPostSection({
    super.key,
    required this.post,
  });
  final PostEntity post;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Post',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          post.description,
          style: TextStyle(
            fontSize: 20,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
