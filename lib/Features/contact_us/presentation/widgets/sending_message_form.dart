import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/contact_us/presentation/manager/contact_us_cubit/contact_us_cubit.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/message_form.dart';
import 'package:real_eye/core/app_validator.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SendingMessageForm extends StatelessWidget {
  const SendingMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactUsCubit, ContactUsState>(
      builder: (context, state) {
        return state.when(
          initial: () => Form(
            key: context.read<ContactUsCubit>().formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 15,
              children: <Widget>[
                LabeledTextField(
                  textEditingController: context.read<ContactUsCubit>().fullName,
                  label: "Full Name",
                  hint: "Enter Your Name",
                  validator: AppValidators.requiredField,
                ),
                LabeledTextField(
                  label: "Email Address",
                  textEditingController: context.read<ContactUsCubit>().email,
                  hint: "Enter Your Email",
                  keyboardType: TextInputType.emailAddress,
                  validator: AppValidators.emailValidation,
                ),
                LabeledTextField(
                  textEditingController: context.read<ContactUsCubit>().message,
                  label: "Message",
                  hint: "Type Your Message...",
                  verticalContentPadding: 90,
                  validator: AppValidators.requiredField,
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                  title: "Send Message",
                  titleSize: 18,
                  buttonHeight: 50,
                  onPressed: () {
                    context.read<ContactUsCubit>().sendMessage();
                  },
                  borderRadius: 8,
                  backgroundColor: const Color(0xff264cf7),
                ),
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
          ),
          loading: () => const MessageForm(
            isLoading: true,
          ),
          success: () => const MessageForm(
            isSuccess: true,
            message: "Message Sent Successfuly",
          ),
          failure: (message) => MessageForm(
            message: message,
          ),
        );
      },
    );
  }
}
