class CommentModel {
  final String id;
  final String text;
  final String author;
  final String postID;
  final DateTime createdAt;

  CommentModel({
    required this.id,
    required this.text,
    required this.author,
    required this.postID,
    required this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      id: json['_id'],
      text: json['text'],
      author: json['author'],
      postID: json['postID'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
