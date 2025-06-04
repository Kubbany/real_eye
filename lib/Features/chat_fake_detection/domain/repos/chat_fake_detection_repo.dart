import 'dart:io';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/video_prediction_entity.dart';
import 'package:real_eye/core/utils/result.dart';

abstract class ChatFakeDetectionRepo {
  Future<Result<List<ImagePredictionEntity>>> predictImage(File image);
  Future<Result<List<VideoPredictionEntity>>> predictVideo(File video);
  Future<Result<List<ImagePredictionEntity>>> predictFromUrl(String imageUrl);
}
