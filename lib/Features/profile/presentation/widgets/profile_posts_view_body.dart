import 'package:flutter/material.dart';
import 'package:real_eye/Features/profile/presentation/widgets/profile_posts_list_view.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';
import 'package:real_eye/core/widgets/user_app_bar.dart';

class ProfilePostsViewBody extends StatelessWidget {
  const ProfilePostsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        UserAppBar(),
        CustomGradientHeader(
          title: "Your Posts",
          titleSize: 40,
        ),
        Expanded(
          child: ProfilePostsListView(),
        ),
      ],
    );
  }
}
