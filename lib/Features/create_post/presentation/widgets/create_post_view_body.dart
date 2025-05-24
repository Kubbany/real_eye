import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_eye/Features/create_post/presentation/managers/create_post_cubit/create_post_cubit.dart';
import 'package:real_eye/Features/create_post/presentation/widgets/custom_post_container.dart';
import 'package:real_eye/core/app_validator.dart';

import 'package:real_eye/core/utils/methods/show_snack_bar_message.dart';
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
              child: Form(
                key: context.read<CreatePostCubit>().formKey,
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
                            textEditingController: context.read<CreatePostCubit>().message,
                            validator: AppValidators.requiredField,
                          ),
                          BlocConsumer<CreatePostCubit, CreatePostState>(
                            listener: (context, state) {
                              if (state is CreatePostSuccess) {
                                context.read<CreatePostCubit>().message.clear();
                                context.read<CreatePostCubit>().formKey.currentState!.reset();
                                showSnackBarMessage(context, "Post Created Successfuly!");
                              } else if (state is CreatePostFailure) {
                                showSnackBarMessage(context, state.errorMessage);
                              }
                            },
                            builder: (context, state) {
                              return CustomButton(
                                isLoading: state is CreatePostLoading,
                                title: "Submit Post",
                                onPressed: () {
                                  context.read<CreatePostCubit>().createPost();
                                },
                                borderRadius: 8,
                                backgroundColor: const Color(0xff183dc9),
                                buttonHeight: 50,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
