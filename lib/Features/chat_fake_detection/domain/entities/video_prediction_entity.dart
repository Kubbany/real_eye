// features/chat_fake_detection/domain/entities/video_prediction_entity.dart
class VideoPredictionEntity {
  final String model;
  final int? fakeFramesCount;
  final String? fakeFramesZip;
  final double? fakePercentage;
  final double? realPercentage;
  final int? totalFramesAnalyzed;
  final int? commonFakeFramesCount;
  final String? commonFakeFramesZip;

  VideoPredictionEntity({
    required this.model,
    this.fakeFramesCount,
    this.fakeFramesZip,
    this.fakePercentage,
    this.realPercentage,
    this.totalFramesAnalyzed,
    this.commonFakeFramesCount,
    this.commonFakeFramesZip,
  });
}
