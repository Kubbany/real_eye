import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/methods/navigate_to_login.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class DeepfakeDetectionActions extends StatelessWidget {
  const DeepfakeDetectionActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: CustomButton(
              title: "Get Started",
              buttonHeight: 55,
              titleSize: 16,
              onPressed: () {
                navigateToLogin(context);
              },
              borderRadius: 64,
              backgroundColor: const Color(0xff224ef6),
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: CustomButton(
              title: "Talk to an expert",
              titleSize: 16,
              buttonHeight: 55,
              borderSideWidth: 1.5,
              borderColor: Colors.blue,
              onPressed: () {
                navigateToLogin(context);
              },
              borderRadius: 64,
              backgroundColor: Colors.transparent,
            ),
          ),
        ],
      ),
    );
  }
}
