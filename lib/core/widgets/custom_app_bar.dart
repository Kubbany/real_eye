import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_images.dart';
import 'package:real_eye/core/utils/app_router.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: 10.0,
          sigmaY: 10.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black.withAlpha(51), // Light transparent overlay
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.withAlpha(50),
              ),
            ),
          ),
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
                onPressed: () {
                  GoRouter.of(context).push(
                    AppRouter.kLoginView,
                  );
                },
                borderColor: Colors.blue,
                borderRadius: 32,
                backgroundColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
