// features/prediction/data/repos/prediction_repo_impl.dart
import 'dart:io';
import 'package:real_eye/Features/chat_fake_detection/data/mappers/image_prediction_mapper.dart';
import 'package:real_eye/Features/chat_fake_detection/data/mappers/video_prediction_mapper.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/repos/chat_fake_detection_repo.dart';
import 'package:real_eye/core/errors/failure.dart';
import 'package:real_eye/core/services/flask_service.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
import 'package:real_eye/core/utils/result.dart';

class ChatFakeDetectionRepoImpl implements ChatFakeDetectionRepo {
  final FlaskService flaskApi;

  ChatFakeDetectionRepoImpl({required this.flaskApi});

  @override
  Future<Result<List<ImagePredictionEntity>>> predictImage(File image) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      final response = await flaskApi.predictImage('Bearer $token', image);
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Result<List<VideoPredictionEntity>>> predictVideo(File video) async {
    try {
      final userModel = await UserManagerService.instance.getLoginResponse();
      final String token = userModel!.token;
      final response = await flaskApi.predictVideo('Bearer $token', video);
      return Result.success(response.toDomain());
    } catch (e) {
      return Result.fail(ErrorHandler.handle(e));
    }
  }
}
