import 'package:json_annotation/json_annotation.dart';
part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  final String fullName, email, message;

  const MessageModel({required this.fullName, required this.email, required this.message});
  factory MessageModel.fromJson(Map<String, dynamic> json) => _$MessageModelFromJson(json);
  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
