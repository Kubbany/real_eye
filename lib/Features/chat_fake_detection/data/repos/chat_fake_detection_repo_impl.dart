// features/prediction/data/repos/prediction_repo_impl.dart
import 'dart:io';
import 'package:real_eye/Features/chat_fake_detection/data/mappers/image_prediction_mapper.dart';
import 'package:real_eye/Features/chat_fake_detection/data/mappers/video_prediction_mapper.dart';
import 'package:real_eye/Features/chat_fake_detection/data/models/url_prediction_request.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/flask_service.dart';
import 'package:real_eye/core/utils/result.dart';

class ChatFakeDetectionRepoImpl implements ChatFakeDetectionRepo {
  final FlaskService flaskApi;

  ChatFakeDetectionRepoImpl({required this.flaskApi});

  @override
  Future<Result<List<ImagePredictionEntity>>> predictImage(File image) async {
    try {
      final response = await flaskApi.predictImage(image);

      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(FlaskHandler.handle(e));
    }
  }

  @override
  Future<Result<List<VideoPredictionEntity>>> predictVideo(File video) async {
    try {
      final response = await flaskApi.predictVideo(video);
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(FlaskHandler.handle(e));
    }
  }

  @override
  Future<Result<List<ImagePredictionEntity>>> predictFromUrl(String imageUrl) async {
    try {
      final response = await flaskApi.predictFromUrl(
        UrlPredictionRequest(imageUrl: imageUrl),
      );
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(FlaskHandler.handle(e));
    }
  }
}
