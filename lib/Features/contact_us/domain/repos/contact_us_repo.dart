import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:real_eye/core/utils/result.dart';

abstract class ContactUsRepo {
  Future<Result<void>> sendMessage({required MessageModel message});
}
