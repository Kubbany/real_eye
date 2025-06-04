// features/prediction/data/models/prediction_model.dart
class ImagePredictionModel {
  final String model;
  final String confidence;
  final String gradcamUrl;
  final String prediction;

  ImagePredictionModel({
    required this.model,
    required this.confidence,
    required this.gradcamUrl,
    required this.prediction,
  });

  factory ImagePredictionModel.fromJson(Map<String, dynamic> json) {
    return ImagePredictionModel(
      model: json['Model'],
      confidence: json['confidence'],
      gradcamUrl: json['gradcam_url'],
      prediction: json['prediction'],
    );
  }
}
