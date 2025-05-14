import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String fullName, email, message;

  const MessageEntity({required this.fullName, required this.email, required this.message});

  @override
  List<Object?> get props => [fullName, email, message];
}
