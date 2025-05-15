import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String fullname, email, message;

  const MessageEntity({required this.fullname, required this.email, required this.message});

  @override
  List<Object?> get props => [fullname, email, message];
}
