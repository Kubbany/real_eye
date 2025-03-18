import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/custom_home_button.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        CustomAppBar(),
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          child: Column(
            children: [
              CustomHomeButton(),
            ],
          ),
        ),
      ],
    );
  }
}
