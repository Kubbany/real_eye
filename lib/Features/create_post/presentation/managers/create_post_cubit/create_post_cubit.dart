import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/create_post/domain/entities/create_post_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final CreatePostRepo createPostRepo;
  final TextEditingController message = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CreatePostCubit(this.createPostRepo) : super(CreatePostInitial());

  Future<void> createPost() async {
    if (formKey.currentState!.validate()) {
      safeEmit(CreatePostLoading());
      final result = await createPostRepo.createPost(description: message.text);
      switch (result) {
        case Success(data: final postID):
          safeEmit(CreatePostSuccess(postID: postID)); // Refresh the posts list
        case Fail(:final fail):
          safeEmit(CreatePostFailure(errorMessage: fail.errorMessage));
      }
    }
  }

  @override
  Future<void> close() {
    message.dispose();
    return super.close();
  }
}
