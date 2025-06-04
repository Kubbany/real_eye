// features/prediction/domain/entities/prediction_entity.dart
class ImagePredictionEntity {
  final String model;
  final String confidence;
  final String gradcamUrl;
  final String prediction;

  ImagePredictionEntity({
    required this.model,
    required this.confidence,
    required this.gradcamUrl,
    required this.prediction,
  });
}
