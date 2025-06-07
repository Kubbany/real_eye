import 'dart:io';

import 'package:dio/dio.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/image_prediction_model.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/url_prediction_request.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/video_prediction_model.dart';
import 'package:retrofit/retrofit.dart';

part 'flask_service.g.dart';

@RestApi(baseUrl: 'http://192.168.1.14:5000/')
abstract class FlaskService {
  factory FlaskService(Dio dio, {String? baseUrl}) = _FlaskService;

  @POST('/predict')
  @MultiPart()
  Future<List<ImagePredictionModel>> predictImage(
    @Part(name: 'file') File image,
  );

  @MultiPart()
  @POST('/predict_video')
  Future<List<VideoPredictionModel>> predictVideo(
    @Part(name: 'file') File video,
  );

  @POST('/predict_url')
  Future<List<ImagePredictionModel>> predictFromUrl(
    @Body() UrlPredictionRequest request,
  );
}
