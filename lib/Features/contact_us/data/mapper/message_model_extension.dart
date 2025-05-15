import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:real_eye/Features/contact_us/domain/entities/message_entity.dart';

extension MessageModelExtension on MessageModel {
  MessageEntity toEntity() {
    return MessageEntity(fullname: fullname, email: email, message: message);
  }
}
