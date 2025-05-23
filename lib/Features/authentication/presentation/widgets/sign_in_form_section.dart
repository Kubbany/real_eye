import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/authentication/presentation/manager/cubits/login_cubit/login_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/services/user_manager_service.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SignInFormSection extends StatelessWidget {
  const SignInFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: <Widget>[
          LabeledTextField(
            label: "Email Address",
            hint: "Enter Your Email",
            textEditingController: context.read<LoginCubit>().email,
            validator: AppValidators.emailValidation,
          ),
          const SizedBox(
            height: 20,
          ),
          LabeledTextField(
            label: "Password",
            isPasswordField: true,
            hint: "Enter Your Password",
            textEditingController: context.read<LoginCubit>().password,
          ),
          const SizedBox(
            height: 25,
          ),
          BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) async {
              if (state is LoginStateSuccess) {
                await UserManagerService.instance.setUserModel(state.user);
                if (context.mounted) {
                  GoRouter.of(context).go(AppRouter.kChatFakeDetectionView);
                  showSnackBarMessage(context, "Logged In Successfuly!");
                }
              }
              if (state is LoginStateFailure) {
                if (context.mounted) {
                  showSnackBarMessage(context, state.errorMessage);
                }
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                absorbing: state is LoginStateLoading,
                child: CustomButton(
                  isLoading: state is LoginStateLoading,
                  title: "Sign In",
                  titleSize: 18,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<LoginCubit>().login();
                  },
                  borderRadius: 8,
                  backgroundColor: const Color(0xff264cf7),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
