// features/chat_fake_detection/data/models/video_prediction_model.dart
class VideoPredictionModel {
  final String model;
  final int fakeFramesCount;
  final String fakeFramesZip;
  final double fakePercentage;
  final double realPercentage;
  final int totalFramesAnalyzed;
  final int commonFakeFramesCount;
  final String commonFakeFramesZip;

  VideoPredictionModel({
    required this.model,
    required this.fakeFramesCount,
    required this.fakeFramesZip,
    required this.fakePercentage,
    required this.realPercentage,
    required this.totalFramesAnalyzed,
    required this.commonFakeFramesCount,
    required this.commonFakeFramesZip,
  });

  factory VideoPredictionModel.fromJson(Map<String, dynamic> json) {
    return VideoPredictionModel(
      model: json['Model'],
      fakeFramesCount: json['fake_frames_count'],
      fakeFramesZip: json['fake_frames_zip'],
      fakePercentage: json['fake_percentage'].toDouble(),
      realPercentage: json['real_percentage'].toDouble(),
      totalFramesAnalyzed: json['total_frames_analyzed'],
      commonFakeFramesCount: json['common_fake_frames_count'],
      commonFakeFramesZip: json['common_fake_frames_zip'],
    );
  }
}
