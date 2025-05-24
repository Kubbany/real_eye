class CreateCommentResponse {
  final bool success;
  final String message;
  final String commentID;

  CreateCommentResponse({
    required this.success,
    required this.message,
    required this.commentID,
  });

  factory CreateCommentResponse.fromJson(Map<String, dynamic> json) {
    return CreateCommentResponse(
      success: json['success'] == 'True' || json['success'] == true,
      message: json['message'],
      commentID: json['commentID'],
    );
  }
}
