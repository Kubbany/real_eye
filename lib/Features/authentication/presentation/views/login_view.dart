import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/Features/authentication/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/login_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: LoginViewBody(),
      ),
    );
  }
}
