// features/chat_fake_detection/data/models/url_prediction_request.dart
class UrlPredictionRequest {
  final String imageUrl;

  UrlPredictionRequest({required this.imageUrl});

  Map<String, dynamic> toJson() => {
        'image_url': imageUrl,
      };
}
