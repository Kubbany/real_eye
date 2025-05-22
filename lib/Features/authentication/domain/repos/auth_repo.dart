import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/core/utils/result.dart';

abstract class AuthRepo {
  Future<Result<void>> register({required RegisterRequest userRequest});
}
