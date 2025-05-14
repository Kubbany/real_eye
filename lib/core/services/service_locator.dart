import 'package:get_it/get_it.dart';
import 'package:real_eye/core/services/api_service.dart';
import 'package:real_eye/core/services/dio_factory.dart';

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(
    ApiService(
      DioFactory.getDio(),
    ),
  );
}
