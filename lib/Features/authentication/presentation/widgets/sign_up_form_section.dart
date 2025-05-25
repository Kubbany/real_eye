import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/authentication/presentation/manager/cubits/register_cubit/register_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/utils/methods/navigate_to_login.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SignUpFormSection extends StatelessWidget {
  const SignUpFormSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          navigateToLogin(context);
          showSnackBarMessage(context, "Registered Successfuly!");
        } else if (state is RegisterFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is RegisterLoading,
          child: Form(
            key: context.read<RegisterCubit>().formKey,
            child: Column(
              children: <Widget>[
                LabeledTextField(
                  label: "Username",
                  hint: "Enter Your Username",
                  textEditingController: context.read<RegisterCubit>().username,
                  validator: AppValidators.requiredField,
                ),
                const SizedBox(
                  height: 20,
                ),
                LabeledTextField(
                  label: "Email Address",
                  hint: "Enter Your Email",
                  textEditingController: context.read<RegisterCubit>().email,
                  validator: AppValidators.emailValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                LabeledTextField(
                  label: "Password",
                  isPasswordField: true,
                  hint: "Enter Your Password",
                  textEditingController: context.read<RegisterCubit>().password,
                  validator: AppValidators.passwordValidation,
                ),
                const SizedBox(
                  height: 20,
                ),
                LabeledTextField(
                  label: "Confirm Password",
                  isPasswordField: true,
                  hint: "Confirm Your Password",
                  validator: (value) {
                    return AppValidators.confirmPasswordValiation(
                      value,
                      context.read<RegisterCubit>().password.text,
                    );
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                CustomButton(
                  isLoading: state is RegisterLoading,
                  title: "Sign Up",
                  titleSize: 18,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<RegisterCubit>().register();
                  },
                  borderRadius: 8,
                  backgroundColor: const Color(0xff264cf7),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
