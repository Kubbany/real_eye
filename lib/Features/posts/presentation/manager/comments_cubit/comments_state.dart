part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentPostLoading extends CommentsState {}

final class CommentsSuccess extends CommentsState {
  final List<CommentEntity> comments;

  CommentsSuccess({required this.comments});
}

final class CommentCreatedSuccess extends CommentsState {
  final String commentId;

  CommentCreatedSuccess({required this.commentId});
}

final class CommentDeletedSuccess extends CommentsState {
  final String message;
  final String commentId;

  CommentDeletedSuccess({
    required this.message,
    required this.commentId,
  });
}

final class CommentsFailure extends CommentsState {
  final String errorMessage;

  CommentsFailure({required this.errorMessage});
}

final class CommentCreatedFailure extends CommentsState {
  final String errorMessage;

  CommentCreatedFailure({required this.errorMessage});
}
