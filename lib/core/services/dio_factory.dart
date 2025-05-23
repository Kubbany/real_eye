import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:real_eye/Features/authentication/data/models/login_response.dart';
import 'package:real_eye/core/services/user_manager_service.dart';

class DioFactory {
  DioFactory._();

  static Dio? _dio;

  static Dio getDio() {
    if (_dio == null) {
      _dio = Dio(
        BaseOptions(
          connectTimeout: const Duration(seconds: 30),
          receiveTimeout: const Duration(seconds: 30),
          sendTimeout: const Duration(seconds: 30),
        ),
      );

      _addDioHeaders();
      // Add interceptors
      _addDioInterceptors();

      // Enable for local development (remove in production)
    }
    return _dio!;
  }

  static void _addDioInterceptors() {
    _dio?.interceptors.addAll([
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        compact: true,
      ),
      // Add other interceptors here if needed
    ]);
  }

  // Clear existing Dio instance (for testing/config changes)
  static void reset() {
    _dio = null;
  }

  static Future<void> _addDioHeaders() async {
    final LoginResponse? loginResponse = await UserManagerService.instance.getLoginResponse();
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${loginResponse?.token ?? ''}',
    };
  }

  static void addTokenAfterLogin(String token) async {
    _dio?.options.headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    };
  }
}
