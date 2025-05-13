import 'package:flutter/material.dart';
import 'package:real_eye/Features/posts/presentation/widgets/posts_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class PostsView extends StatelessWidget {
  const PostsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: PostsViewBody(),
    );
  }
}
