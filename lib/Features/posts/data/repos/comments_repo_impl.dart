import 'package:real_eye/Features/posts/data/models/create_comment_request.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
import 'package:real_eye/core/utils/result.dart';

import '../../domain/entities/comment_entity.dart';
import '../../domain/repos/comments_repo.dart';

import '../mappers/comment_mapper.dart';

class CommentsRepoImpl implements CommentsRepo {
  final ApiService api;

  CommentsRepoImpl({required this.api});

  @override
  Future<Result<List<CommentEntity>>> getComments(String postId) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      final response = await api.getComments(postId, 'Bearer $token');
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<String>> createComment({
    required String text,
    required String postId,
  }) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      final response = await api.createComment(
        'Bearer $token',
        CreateCommentRequest(text: text, postID: postId),
      );
      return Result.success(response.commentID);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<void>> deleteComment(String commentId) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      await api.deleteComment(commentId, 'Bearer $token');
      return const Result.success(null);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
