// features/prediction/data/mappers/prediction_mapper.dart

import 'package:real_eye/Features/chat_fake_detection/data/models/image_prediction_model.dart';
import 'package:real_eye/Features/chat_fake_detection/domain/entities/image_prediction_entity.dart';

extension ImagePredictionMapper on ImagePredictionModel {
  ImagePredictionEntity toDomain() {
    return ImagePredictionEntity(
      model: model,
      confidence: confidence,
      gradcamUrl: gradcamUrl,
      prediction: prediction,
    );
  }
}

extension PredictionListMapper on List<ImagePredictionModel> {
  List<ImagePredictionEntity> toDomain() {
    return map((model) => model.toDomain()).toList();
  }
}
