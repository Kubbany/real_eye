import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/presentation/manager/comments_cubit/comments_cubit.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comment_item.dart';
import 'package:real_eye/Features/profile/presentation/widgets/profile_comment_item.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProfileCommentsListView extends StatelessWidget {
  const ProfileCommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsState>(
      listener: (context, state) {
        if (state is CommentDeletedSuccess) {
          showSnackBarMessage(context, "Comment Deleted Successfuly");
        }
      },
      builder: (context, state) {
        if (state is CommentsSuccess) {
          if (state.comments.isEmpty) {
            return const SliverToBoxAdapter(
              child: Center(
                child: Text(
                  "No Comments Yet",
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
              ),
            );
          }
          return SliverList.separated(
            itemCount: state.comments.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) => ProfileCommentItem(
              comment: state.comments[(state.comments.length - 1) - index],
            ),
          );
        } else if (state is CommentsFailure) {
          return SliverToBoxAdapter(child: Text(state.errorMessage));
        } else {
          return SliverList.separated(
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) => const Skeletonizer(child: MockCommentItem()),
          );
        }
      },
    );
  }
}
