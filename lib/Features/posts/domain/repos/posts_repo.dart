import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/core/utils/result.dart';

abstract class PostsRepo {
  Future<Result<List<PostEntity>>> getPosts();
}
