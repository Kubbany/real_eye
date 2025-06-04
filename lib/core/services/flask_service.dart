import 'dart:io';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'flask_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.3:5000/')
abstract class FlaskService {
  factory FlaskService(Dio dio, {String? baseUrl}) = _FlaskService;
}
