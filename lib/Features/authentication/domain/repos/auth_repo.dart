import 'package:real_eye/Features/authentication/data/models/login_request.dart';
import 'package:real_eye/Features/authentication/data/models/login_response.dart';
import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/core/utils/result.dart';

abstract class AuthRepo {
  Future<Result<void>> register({required RegisterRequest userRequest});
  Future<Result<LoginResponse>> login({required LoginRequest loginRequest});
  Future<Result<UserModel>> getCurrentUser();
}
