import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/domain/entities/comment_entity.dart';

class CommentItem extends StatelessWidget {
  final CommentEntity comment;

  const CommentItem({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Text(
          comment.text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MockCommentItem extends StatelessWidget {
  // final String comment;

  const MockCommentItem({
    super.key,
    //required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          "commentaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasasdasdsdasdsdasdasdsdasdawdasds",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
