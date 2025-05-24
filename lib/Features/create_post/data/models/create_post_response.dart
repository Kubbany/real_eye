class CreatePostResponse {
  final bool success;
  final String message;
  final String postID;

  CreatePostResponse({
    required this.success,
    required this.message,
    required this.postID,
  });

  factory CreatePostResponse.fromJson(Map<String, dynamic> json) {
    return CreatePostResponse(
      success: json['success'],
      message: json['message'],
      postID: json['postID'],
    );
  }
}
