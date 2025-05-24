part of 'comments_cubit.dart';

@immutable
sealed class CommentsState {}

final class CommentsInitial extends CommentsState {}

final class CommentsLoading extends CommentsState {}

final class CommentsSuccess extends CommentsState {
  final List<CommentEntity> comments;

  CommentsSuccess({required this.comments});
}

final class CommentsFailure extends CommentsState {
  final String errorMessage;

  CommentsFailure({required this.errorMessage});
}
