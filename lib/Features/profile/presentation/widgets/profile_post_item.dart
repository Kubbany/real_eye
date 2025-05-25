import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/posts/presentation/manager/post_cubit/posts_cubit.dart';
import 'package:real_eye/Features/posts/presentation/widgets/post_creation_details.dart';

import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';

class ProfilePostItem extends StatelessWidget {
  final PostEntity post;

  const ProfilePostItem({
    super.key,
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff111111),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCreationDetails(timeAgo: timeAgo(post.createdAt)),
            const SizedBox(height: 12),
            Text(
              post.description,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                spacing: 10,
                children: <Widget>[
                  CustomButton(
                    title: "Delete",
                    onPressed: () async {
                      final shouldDelete = await _showDeleteDialog(context);
                      if (shouldDelete == true) {
                        if (context.mounted) {
                          context.read<PostsCubit>().deletePost(post.id);
                        }
                      }
                    },
                    borderRadius: 64,
                    backgroundColor: Colors.red,
                  ),
                  CustomButton(
                    title: "Comment",
                    onPressed: () async {
                      if (context.mounted) {
                        GoRouter.of(context).push(AppRouter.kProfileCommentsView, extra: post);
                      }
                    },
                    borderRadius: 64,
                    backgroundColor: const Color(0xff183cc5),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String timeAgo(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inMinutes < 1) return 'just now';
    if (difference.inHours < 1) return '${difference.inMinutes}m ago';
    if (difference.inDays < 1) return '${difference.inHours}h ago';
    if (difference.inDays < 7) return '${difference.inDays}d ago';

    return '${date.day}/${date.month}/${date.year % 100}';
  }

  Future<bool?> _showDeleteDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Post'),
        content: const Text('Are you sure you want to delete this post?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}

class MockProfilePostItem extends StatelessWidget {
  final String comment;
  final String timeAgo;

  const MockProfilePostItem({
    super.key,
    required this.comment,
    this.timeAgo = 'just now',
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff111111),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PostCreationDetails(timeAgo: timeAgo),
            const SizedBox(height: 12),
            Text(
              comment,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: CustomButton(
                title: "Comment",
                onPressed: () {},
                borderRadius: 64,
                backgroundColor: const Color(0xff183cc5),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
