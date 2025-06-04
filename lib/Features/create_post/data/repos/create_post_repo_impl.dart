import 'package:real_eye/Features/create_post/data/models/create_post_request.dart';
import 'package:real_eye/Features/create_post/domain/entities/create_post_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/utils/result.dart';

class CreatePostRepoImpl extends CreatePostRepo {
  final ApiService api;

  CreatePostRepoImpl({required this.api});
  @override
  Future<Result<String>> createPost({required String description}) async {
    try {
      final response = await api.createPost(
        CreatePostRequest(desc: description),
      );
      return Result.success(response.postID);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
