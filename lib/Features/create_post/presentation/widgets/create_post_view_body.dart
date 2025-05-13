import 'package:flutter/material.dart';
import 'package:real_eye/Features/create_post/presentation/widgets/custom_post_container.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';
import 'package:real_eye/core/widgets/custom_text_field.dart';
import 'package:real_eye/core/widgets/user_app_bar.dart';

class CreatePostViewBody extends StatelessWidget {
  const CreatePostViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const UserAppBar(),
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CustomPostContainer(
                    child: Column(
                      spacing: 30,
                      children: <Widget>[
                        const CustomGradientHeader(
                          title: "Create New Post",
                          titleSize: 30,
                        ),
                        CustomTextField(
                          hintText: "What's on your mind?",
                          verticalContentPadding: 90,
                          fillColor: Colors.transparent,
                          borderColor: Colors.grey[600],
                          borderRadius: 10,
                        ),
                        CustomButton(
                          title: "Submit Post",
                          onPressed: () {},
                          borderRadius: 8,
                          backgroundColor: const Color(0xff183dc9),
                          buttonHeight: 50,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
