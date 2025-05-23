import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/authentication/domain/entities/user_entity.dart';

extension UserModelExtension on UserModel {
  UserEntity toEntity() {
    return UserEntity(userID: userID ?? '', email: email, username: username);
  }
}
