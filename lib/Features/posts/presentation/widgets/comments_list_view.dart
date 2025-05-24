import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/presentation/manager/comments_cubit/comments_cubit.dart';
import 'package:real_eye/Features/posts/presentation/widgets/comment_item.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CommentsListView extends StatelessWidget {
  const CommentsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CommentsCubit, CommentsState>(
      builder: (context, state) {
        if (state is CommentsSuccess) {
          return SliverList.separated(
            itemCount: state.comments.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 8,
            ),
            itemBuilder: (context, index) => state.comments.isNotEmpty
                ? CommentItem(
                    comment: state.comments[(state.comments.length - 1) - index],
                  )
                : const SliverToBoxAdapter(
                    child: Center(
                      child: Text(
                        "No Comments  Yet",
                        style: TextStyle(fontSize: 20, color: Colors.grey),
                      ),
                    ),
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
