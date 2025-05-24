part of 'posts_cubit.dart';

@immutable
sealed class PostsState {}

final class PostsInitial extends PostsState {}

final class PostsLoading extends PostsState {}

final class PostsSuccess extends PostsState {
  final List<PostEntity> posts;

  PostsSuccess({required this.posts});
}

final class PostsFailure extends PostsState {
  final String errorMessage;

  PostsFailure({required this.errorMessage});
}
