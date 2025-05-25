import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/contact_us/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SendingMessageForm extends StatelessWidget {
  const SendingMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is ContactUsStateSuccess) {
          showSnackBarMessage(context, 'Message Sent Successfully!');
        } else if (state is ContactUsStateFailure) {
          showSnackBarMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        return AbsorbPointer(
          absorbing: state is ContactUsStateLoading,
          child: Form(
            key: context.read<ContactUsCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 15),
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
                const SizedBox(height: 10),
                CustomButton(
                  isLoading: state is ContactUsStateLoading,
                  title: "Send Message",
                  titleSize: 18,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<ContactUsCubit>().sendMessage();
                  },
                  borderRadius: 8,
                  backgroundColor: const Color(0xff264cf7),
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 40),
              ],
            ),
          ),
        );
      },
    );
  }
}
