import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/domain/entities/comment_entity.dart';
import 'package:real_eye/Features/posts/domain/repos/comments_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final CommentsRepo commentsRepo;

  CommentsCubit(this.commentsRepo) : super(CommentsInitial());

  Future<void> getComments(String postId) async {
    safeEmit(CommentsLoading());
    final result = await commentsRepo.getComments(postId);
    switch (result) {
      case Success():
        safeEmit(CommentsSuccess(comments: result.data));
      case Fail(:final fail):
        safeEmit(CommentsFailure(errorMessage: fail.errorMessage));
    }
  }
}
