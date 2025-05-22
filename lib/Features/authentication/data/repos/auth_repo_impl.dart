import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/utils/result.dart';

class AuthRepoImpl extends AuthRepo {
  final ApiService api;

  AuthRepoImpl({required this.api});

  @override
  Future<Result<void>> register({required RegisterRequest userRequest}) async {
    try {
      final response = await api.postRegister(userRequest);
      return Result.success(response);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
