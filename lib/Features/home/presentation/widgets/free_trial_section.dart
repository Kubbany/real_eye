import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/custom_home_button.dart';

class FreeTrialSection extends StatelessWidget {
  const FreeTrialSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 30,
        children: [
          const SizedBox(
            height: 40,
          ),
          const CustomHomeButton(),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.7,
            child: const Text(
              "Detect Deepfakes Instantly With Real Eye",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
