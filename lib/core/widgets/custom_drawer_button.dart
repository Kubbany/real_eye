import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class CustomDrawerButton extends StatelessWidget {
  const CustomDrawerButton({super.key, required this.title, required this.onPressed});
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: CustomButton(
        title: title,
        titleSize: 18,
        onPressed: onPressed,
        borderRadius: 8,
        backgroundColor: const Color(0xff303030),
        buttonHeight: 50,
      ),
    );
  }
}
