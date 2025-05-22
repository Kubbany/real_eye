import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/authentication/data/models/login_request.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginStateInitial());
  final AuthRepo authRepo;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    safeEmit(LoginStateLoading());
    final LoginRequest loginRequest = LoginRequest(
      email: email.text,
      password: password.text,
    );
    final result = await authRepo.login(loginRequest: loginRequest);

    switch (result) {
      case Success():
        safeEmit(LoginStateSuccess());
      case Fail(:final fail):
        safeEmit(LoginStateFailure(errorMessage: fail.errorMessage));
    }
  }

  @override
  Future<void> close() async {
    super.close();
    email.dispose();
    password.dispose();
  }
}
