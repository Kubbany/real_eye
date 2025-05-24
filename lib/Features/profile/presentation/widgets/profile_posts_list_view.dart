import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/presentation/manager/post_cubit/posts_cubit.dart';

import 'package:real_eye/Features/profile/presentation/widgets/profile_post_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfilePostsListView extends StatelessWidget {
  const ProfilePostsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsState>(
      builder: (context, state) {
        if (state is PostsSuccess) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.posts.length,
            itemBuilder: (context, index) => state.posts.isNotEmpty
                ? ProfilePostItem(
                    post: state.posts[(state.posts.length - 1) - index],
                  )
                : const Center(
                    child: Text(
                      "You Haven't Posted Anything",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ),
          );
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
