import 'package:flutter/material.dart';
import 'package:real_eye/Features/create_post/presentation/widgets/create_post_view_body.dart';
import 'package:real_eye/core/widgets/user_drawer.dart';

class CreatePostView extends StatelessWidget {
  const CreatePostView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      drawer: UserDrawer(),
      body: CreatePostViewBody(),
    );
  }
}
