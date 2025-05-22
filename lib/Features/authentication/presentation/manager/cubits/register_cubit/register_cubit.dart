import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/authentication/data/models/register_request.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/utils/result.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this.authRepo) : super(RegisterInitial());
  final AuthRepo authRepo;
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> register() async {
    safeEmit(RegisterLoading());
    final RegisterRequest userRequest = RegisterRequest(
      username: username.text,
      email: email.text,
      password: password.text,
    );
    final result = await authRepo.register(userRequest: userRequest);

    switch (result) {
      case Success():
        safeEmit(RegisterSuccess());
      case Fail(:final fail):
        safeEmit(RegisterFailure(errorMessage: fail.errorMessage));
    }
  }

  @override
  Future<void> close() async {
    super.close();
    username.dispose();
    email.dispose();
    password.dispose();
  }
}
