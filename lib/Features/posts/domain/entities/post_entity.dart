class PostEntity {
  final String id;
  final String userID;
  final String description;
  final DateTime createdAt;

  PostEntity({
    required this.id,
    required this.userID,
    required this.description,
    required this.createdAt,
  });
}
