import 'package:real_eye/Features/posts/data/models/post_model.dart';
import 'package:real_eye/Features/posts/domain/entities/post_entity.dart';

extension PostMapper on PostModel {
  PostEntity toDomain() {
    return PostEntity(
      id: id,
      userID: userID,
      description: desc,
      createdAt: createdAt,
    );
  }
}

extension PostListMapper on List<PostModel> {
  List<PostEntity> toDomain() {
    return map((model) => model.toDomain()).toList();
  }
}
