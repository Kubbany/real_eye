class DeleteCommentResponse {
  final bool success;
  final String message;

  DeleteCommentResponse({
    required this.success,
    required this.message,
  });

  factory DeleteCommentResponse.fromJson(Map<String, dynamic> json) {
    return DeleteCommentResponse(
      success: json['success'] == true || json['success'] == 'true',
      message: json['message']?.toString() ?? 'Success',
    );
  }
}
