import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:real_eye/Features/authentication/data/models/login_request.dart';
import 'package:real_eye/Features/authentication/data/models/user_model.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/core/extensions/safe_emit.dart';
import 'package:real_eye/core/services/dio_factory.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
import 'package:real_eye/core/utils/result.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepo) : super(LoginStateInitial());
  final AuthRepo authRepo;
  final UserManagerService userManagerService = UserManagerService.instance;
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future<void> login() async {
    safeEmit(LoginStateLoading());
    final LoginRequest loginRequest = LoginRequest(
      email: email.text,
      password: password.text,
    );
    final loginResponseResult = await authRepo.login(loginRequest: loginRequest);

    switch (loginResponseResult) {
      case Success():
        await userManagerService.setLoginResponse(loginResponseResult.data);
        DioFactory.addTokenAfterLogin(loginResponseResult.data.token);
        final userModel = await authRepo.getCurrentUser();
        userModel.when(
          success: (user) {
            safeEmit(LoginStateSuccess(user: user));
          },
          failure: (fail) {
            safeEmit(LoginStateFailure(errorMessage: fail.errorMessage));
          },
        );
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
