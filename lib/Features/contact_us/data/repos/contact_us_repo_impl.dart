import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:real_eye/Features/contact_us/domain/repos/contact_us_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/utils/result.dart';

class ContactUsRepoImpl extends ContactUsRepo {
  final ApiService api;

  ContactUsRepoImpl({required this.api});
  @override
  Future<Result<void>> sendMessage({required MessageModel message}) async {
    try {
      final response = await api.postMessage(message);
      return Result.success(response);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
