import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/presentation/manager/post_cubit/posts_cubit.dart';
import 'package:real_eye/Features/posts/presentation/widgets/post_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PostsListView extends StatelessWidget {
  const PostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsSuccess) {
          if (state.posts.isEmpty) {
            return const Center(
              child: Text(
                "No Posts Available Yet",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            );
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.posts.length,
              itemBuilder: (context, index) => PostItem(
                    post: state.posts[index],
                  ));
        } else if (state is PostsFailure) {
          return Center(
            child: Text(state.errorMessage),
          );
        } else {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, index) => const Skeletonizer(
              child: MockPostItem(
                comment: "Mock Comment",
              ),
            ),
          );
        }
      },
    );
  }
}
