import 'package:flutter/material.dart';

class FAQCard extends StatelessWidget {
  const FAQCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 16,
      ),
      padding: const EdgeInsets.all(
        16,
      ),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Color(0xff111111),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: child,
    );
  }
}
