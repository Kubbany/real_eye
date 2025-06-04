import 'dart:io';

import 'package:dio/dio.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/image_prediction_model.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/video_prediction_model.dart';
import 'package:retrofit/retrofit.dart';

part 'flask_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.3:5000/')
abstract class FlaskService {
  factory FlaskService(Dio dio, {String? baseUrl}) = _FlaskService;

  @MultiPart()
  @POST('/predict')
  Future<List<ImagePredictionModel>> predictImage(
    @Header('Authorization') String token,
    @Part() File image,
  );

  @MultiPart()
  @POST('/predict_video')
  Future<List<VideoPredictionModel>> predictVideo(
    @Header('Authorization') String token,
    @Part() File video,
  );
}
