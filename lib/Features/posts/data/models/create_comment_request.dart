class CreateCommentRequest {
  final String text;
  final String postID;

  CreateCommentRequest({
    required this.text,
    required this.postID,
  });

  Map<String, dynamic> toJson() => {
        'text': text,
        'postID': postID,
      };
}
