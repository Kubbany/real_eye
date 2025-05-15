import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/contact_us/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class MessageForm extends StatelessWidget {
  const MessageForm({
    super.key,
    this.isLoading = false,
    this.isSuccess = false,
    this.message,
  });
  final bool isLoading;
  final bool isSuccess;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<ContactUsCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: <Widget>[
          LabeledTextField(
            textEditingController: context.read<ContactUsCubit>().fullName,
            label: "Full Name",
            hint: "Enter Your Name",
            validator: (value) => AppValidators.requiredField(
              value,
              ignoreValidation: context.read<ContactUsCubit>().ignoreValidation,
            ),
          ),
          LabeledTextField(
            label: "Email Address",
            textEditingController: context.read<ContactUsCubit>().email,
            hint: "Enter Your Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) => AppValidators.emailValidation(
              value,
              ignoreValidation: context.read<ContactUsCubit>().ignoreValidation,
            ),
          ),
          LabeledTextField(
            textEditingController: context.read<ContactUsCubit>().message,
            label: "Message",
            hint: "Type Your Message...",
            verticalContentPadding: 90,
            validator: (value) => AppValidators.requiredField(
              value,
              ignoreValidation: context.read<ContactUsCubit>().ignoreValidation,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            isLoading: isLoading,
            title: "Send Message",
            titleSize: 18,
            buttonHeight: 50,
            onPressed: () {
              context.read<ContactUsCubit>().sendMessage();
            },
            borderRadius: 8,
            backgroundColor: const Color(0xff264cf7),
          ),
          !isLoading
              ? Center(
                  child: Text(
                    message!,
                    style: TextStyle(
                      color: isSuccess ? Colors.green : Colors.red,
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(
            height: 20,
          ),
          CustomButton(
            title: "Back to Home",
            titleSize: 16,
            onPressed: () {
              GoRouter.of(context).go(AppRouter.kHomeView);
            },
            borderRadius: 64,
            backgroundColor: Colors.black,
            borderColor: Colors.blue,
            borderSideWidth: 1.5,
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
