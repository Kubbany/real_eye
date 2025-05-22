import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/authentication/domain/repos/auth_repo.dart';
import 'package:real_eye/Features/authentication/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/register_view_body.dart';
import 'package:real_eye/core/services/service_locator.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(getIt<AuthRepo>()),
      child: const Scaffold(
        body: RegisterViewBody(),
      ),
    );
  }
}
