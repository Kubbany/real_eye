class CreatePostRequest {
  final String desc;

  CreatePostRequest({required this.desc});

  Map<String, dynamic> toJson() => {
        'desc': desc,
      };
}
