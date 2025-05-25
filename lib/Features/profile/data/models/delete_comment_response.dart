class DeleteCommentResponse {
  final bool success;
  final String message;

  DeleteCommentResponse({
    required this.success,
    required this.message,
  });

  factory DeleteCommentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCommentResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
