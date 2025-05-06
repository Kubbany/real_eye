import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/utils/methods/navigate_to_login.dart';
import 'package:real_eye/core/widgets/blured_app_bar.dart';
import 'package:real_eye/core/widgets/custom_button.dart';
import 'package:real_eye/core/widgets/drawer_menu_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});
  @override
  Widget build(BuildContext context) {
    return BluredAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: [
              const DrawerMenuIcon(),
              Image.asset(
                Assets.imagesSplashLogo,
              ),
            ],
          ),
          CustomButton(
            title: "Get Started",
            titleColor: Colors.white,
            onPressed: () {
              navigateToLogin(context);
            },
            borderColor: Colors.blue,
            borderRadius: 32,
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }
}
