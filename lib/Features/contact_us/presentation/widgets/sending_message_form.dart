import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/labeled_text_field.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class SendingMessageForm extends StatelessWidget {
  const SendingMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 15,
        children: <Widget>[
          const LabeledTextField(
            label: "Full Name",
            hint: "Enter Your Name",
          ),
          LabeledTextField(
            label: "Email Address",
            hint: "Enter Your Email",
            keyboardType: TextInputType.emailAddress,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "This Field Cannot Be Empty";
              }
              final emailRegex = RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return "Please Enter A Valid Email";
              }
              return null;
            },
          ),
          const LabeledTextField(
            label: "Message",
            hint: "Type Your Message...",
            verticalContentPadding: 90,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            title: "Send Message",
            titleSize: 18,
            buttonHeight: 50,
            onPressed: () {},
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
    );
  }
}
