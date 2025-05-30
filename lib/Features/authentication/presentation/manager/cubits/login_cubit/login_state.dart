part of 'login_cubit.dart';

@immutable
sealed class LoginState {}

final class LoginStateInitial extends LoginState {}

final class LoginStateLoading extends LoginState {}

final class LoginStateSuccess extends LoginState {
  final UserModel user;

  LoginStateSuccess({required this.user});
}

final class LoginStateFailure extends LoginState {
  final String errorMessage;

  LoginStateFailure({required this.errorMessage});
}
