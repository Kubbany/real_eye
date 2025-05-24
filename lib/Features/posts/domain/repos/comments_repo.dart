import 'package:real_eye/core/utils/result.dart';

import '../../domain/entities/comment_entity.dart';

abstract class CommentsRepo {
  Future<Result<List<CommentEntity>>> getComments(String postId);
  Future<Result<String>> createComment({required String text, required String postId});
}
