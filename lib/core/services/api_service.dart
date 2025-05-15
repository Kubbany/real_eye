import 'package:dio/dio.dart';
import 'package:real_eye/Features/contact_us/data/models/message_model.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.3:5555/api/')
abstract class ApiService {
  factory ApiService(Dio dio, {String? baseUrl}) = _ApiService;

  @POST('/contact')
  Future<void> postMessage(@Body() MessageModel message);
}
