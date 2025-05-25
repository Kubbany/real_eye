import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/domain/entities/comment_entity.dart';
import 'package:real_eye/Features/posts/presentation/manager/comments_cubit/comments_cubit.dart';

class ProfileCommentItem extends StatelessWidget {
  final CommentEntity comment;

  const ProfileCommentItem({
    super.key,
    required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          comment.text,
          style: const TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, size: 28, color: Colors.red),
          onPressed: () async {
            final shouldDelete = await _showDeleteCommentDialog(context);
            if (shouldDelete == true) {
              if (context.mounted) {
                context.read<CommentsCubit>().deleteComment(commentId: comment.id, postId: comment.postId);
              }
            }
          },
        ),
      ),
    );
  }

  Future<bool?> _showDeleteCommentDialog(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Comment'),
        content: const Text('Are you sure you want to delete this comment?'),
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
