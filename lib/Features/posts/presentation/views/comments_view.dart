import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comments_view_body.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CommentsViewBody(),
    );
  }
}
