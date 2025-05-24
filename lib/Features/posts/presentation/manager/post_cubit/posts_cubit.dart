import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/Features/posts/domain/repos/posts_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';
part 'posts_state.dart';

class PostsCubit extends Cubit<PostsState> {
  final PostsRepo postRepo;

  PostsCubit(this.postRepo) : super(PostsInitial());

  Future<void> getPosts() async {
    safeEmit(PostsLoading());
    final posts = await postRepo.getPosts();
    switch (posts) {
      case Success():
        safeEmit(PostsSuccess(posts: posts.data));

      case Fail(:final fail):
        safeEmit(PostsFailure(errorMessage: fail.errorMessage));
    }
  }
}
