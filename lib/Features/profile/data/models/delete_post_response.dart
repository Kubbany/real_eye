class DeletePostResponse {
  final bool success;
  final String message;

  DeletePostResponse({
    required this.success,
    required this.message,
  });

  factory DeletePostResponse.fromJson(Map<String, dynamic> json) {
    return DeletePostResponse(
      success: json['success'],
      message: json['message'],
    );
  }
}
