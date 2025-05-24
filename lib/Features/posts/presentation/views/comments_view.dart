import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comments_view_body.dart';

class CommentsView extends StatelessWidget {
  const CommentsView({super.key});

  @override
  Widget build(BuildContext context) {
    final extra = GoRouterState.of(context).extra as PostEntity;
    return Scaffold(
      body: SafeArea(
        child: CommentsViewBody(
          post: extra,
        ),
      ),
    );
  }
}
