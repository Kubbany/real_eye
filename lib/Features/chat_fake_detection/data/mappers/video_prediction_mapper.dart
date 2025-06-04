// features/chat_fake_detection/data/mappers/video_prediction_mapper.dart
import '../models/video_prediction_model.dart';
import '../../domain/entities/video_prediction_entity.dart';

extension VideoPredictionMapper on VideoPredictionModel {
  VideoPredictionEntity toDomain() {
    return VideoPredictionEntity(
      model: model,
      fakeFramesCount: fakeFramesCount,
      fakeFramesZip: fakeFramesZip,
      fakePercentage: fakePercentage,
      realPercentage: realPercentage,
      totalFramesAnalyzed: totalFramesAnalyzed,
      commonFakeFramesCount: commonFakeFramesCount,
      commonFakeFramesZip: commonFakeFramesZip,
    );
  }
}

extension VideoPredictionListMapper on List<VideoPredictionModel> {
  List<VideoPredictionEntity> toDomain() {
    return map((model) => model.toDomain()).toList();
  }
}
