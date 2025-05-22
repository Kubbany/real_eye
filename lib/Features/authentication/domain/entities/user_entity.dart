import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String userID, username, email;

  const UserEntity({required this.userID, required this.username, required this.email});

  @override
  List<Object?> get props => [userID, email, username];
}
