import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
import 'package:real_eye/core/widgets/custom_text_field.dart';

class SendingMessageForm extends StatelessWidget {
  const SendingMessageForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: GlobalKey<FormState>(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5,
        children: <Widget>[
          const Text(
            "Full Name",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(),
          const CustomTextField(
            hintText: "Enter Your Name",
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Email Address",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(),
          CustomTextField(
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
            hintText: "Enter Your Email",
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Message",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(),
          const CustomTextField(
            hintText: "Type Your Message...",
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
