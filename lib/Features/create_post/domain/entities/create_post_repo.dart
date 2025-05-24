import 'package:real_eye/core/utils/result.dart';

abstract class CreatePostRepo {
  Future<Result<String>> createPost({required String description});
}
