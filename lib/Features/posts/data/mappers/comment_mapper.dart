import '../models/comment_model.dart';
import '../../domain/entities/comment_entity.dart';

extension CommentMapper on CommentModel {
  CommentEntity toDomain() {
    return CommentEntity(
      id: id,
      text: text,
      authorId: author,
      createdAt: createdAt,
    );
  }
}

extension CommentListMapper on List<CommentModel> {
  List<CommentEntity> toDomain() {
    return map((model) => model.toDomain()).toList();
  }
}
