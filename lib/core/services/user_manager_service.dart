import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:real_eye/Features/authentication/data/models/login_response.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';

class UserManagerService {
  UserManagerService._();

  static UserManagerService instance = UserManagerService._();
  final String _loginResponseKey = "LoginResponseKey";
  final String _userKey = "UserKey";
  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
  Future<LoginResponse?> getLoginResponse() async {
    final String? jsonString = await secureStorage.read(key: _loginResponseKey);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    return LoginResponse.fromJson(jsonDecode(jsonString));
  }

  Future<void> setLoginResponse(LoginResponse loginResponse) async {
    return await secureStorage.write(key: _loginResponseKey, value: jsonEncode(loginResponse.toJson()));
  }

  Future<UserModel?> getUserModel() async {
    final String? jsonString = await secureStorage.read(key: _userKey);
    if (jsonString == null || jsonString.isEmpty) {
      return null;
    }
    return UserModel.fromJson(jsonDecode(jsonString));
  }

  Future<void> setUserModel(UserModel user) async {
    return await secureStorage.write(key: _userKey, value: jsonEncode(user.toJson()));
  }
}
