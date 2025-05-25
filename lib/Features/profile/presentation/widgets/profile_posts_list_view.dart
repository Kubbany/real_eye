import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/presentation/manager/post_cubit/posts_cubit.dart';

import 'package:real_eye/Features/profile/presentation/widgets/profile_post_item.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePostsListView extends StatelessWidget {
  const ProfilePostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PostsCubit, PostsState>(
      listener: (context, state) {
        if (state is PostDeletedSuccess) {
          showSnackBarMessage(context, state.message);
        } else if (state is PostsFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is PostsSuccess || state is PostDeletedSuccess) {
          final posts = state is PostsSuccess ? state.posts : (state as PostDeletedSuccess).remainingPosts;
          if (posts.isEmpty) {
            return const Center(
              child: Text(
                "You Haven't Posted Anything",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            );
          }
          return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) => ProfilePostItem(
                    post: posts[(posts.length - 1) - index],
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
              child: MockProfilePostItem(
                comment: "Mock Comment",
              ),
            ),
          );
        }
      },
    );
  }
}
