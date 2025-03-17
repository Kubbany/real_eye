import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      height: 85,
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
        top: 25,
        bottom: 5,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Image.asset(
            Assets.imagesSplashLogo,
          ),
          CustomButton(
            title: "Get Started",
            titleColor: Colors.white,
            onPressed: () {},
            borderColor: Colors.blue,
            borderRadius: 32,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
