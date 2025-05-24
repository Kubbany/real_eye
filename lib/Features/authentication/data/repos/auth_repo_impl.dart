import 'package:real_eye/Features/authentication/data/models/login_request.dart';
import 'package:real_eye/Features/authentication/data/models/login_response.dart';
import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
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

  @override
  Future<Result<LoginResponse>> login({required LoginRequest loginRequest}) async {
    try {
      final response = await api.postLogin(loginRequest);
      return Result.success(response);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<UserModel>> getCurrentUser() async {
    try {
      final response = await api.getCurrentUser();
      final LoginResponse? loginResponse = await UserManagerService.instance.getLoginResponse();
      response.userID = loginResponse?.userID ?? "";
      return Result.success(response);
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
