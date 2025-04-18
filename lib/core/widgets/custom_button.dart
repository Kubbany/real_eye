import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
    this.borderColor,
    this.titleColor,
    required this.borderRadius,
    required this.backgroundColor,
  });

  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                  width: 2.5,
                )
              : BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius),
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: titleColor ?? Colors.white,
        ),
      ),
    );
  }
}
