import 'package:real_eye/Features/posts/data/mappers/post_maper.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';
import 'package:real_eye/Features/posts/domain/repos/posts_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
import 'package:real_eye/core/utils/result.dart';

class PostsRepoImpl extends PostsRepo {
  final ApiService api;

  PostsRepoImpl({required this.api});
  @override
  Future<Result<List<PostEntity>>> getPosts() async {
    try {
      var userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      final response = await api.getPosts('Bearer $token');
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<void>> deletePost(String postId) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      await api.deletePost(postId, 'Bearer $token');
      return const Result.success(null);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
