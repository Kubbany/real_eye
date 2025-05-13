import 'package:flutter/material.dart';

class CustomPostContainer extends StatelessWidget {
  const CustomPostContainer({
    super.key,
    required this.child,
  });
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 80,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 25,
      ),
      decoration: const BoxDecoration(
        color: Color(0xff111111),
        borderRadius: BorderRadius.all(
          Radius.circular(
            16,
          ),
        ),
      ),
      child: child,
    );
  }
}
