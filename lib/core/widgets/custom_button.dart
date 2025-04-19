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
    this.titleSize,
    this.buttonHeight,
    this.borderSideWidth,
  });

  final VoidCallback onPressed;
  final String title;
  final Color backgroundColor;
  final Color? borderColor;
  final Color? titleColor;
  final double borderRadius;
  final double? titleSize;
  final double? buttonHeight;
  final double? borderSideWidth;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: buttonHeight == null ? null : Size(double.infinity, buttonHeight!),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          side: borderColor != null
              ? BorderSide(
                  color: borderColor!,
                  width: borderSideWidth ?? 2.5,
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
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: titleSize,
          color: titleColor ?? Colors.white,
        ),
      ),
    );
  }
}
