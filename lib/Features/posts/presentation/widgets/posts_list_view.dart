import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/presentation/widgets/anonymous_post_card.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) => const PostItem(comment: "Mock Comment"),
    );
  }
}
