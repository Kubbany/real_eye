import 'package:flutter/material.dart';

class KnowledgeCenterCaseCard extends StatelessWidget {
  const KnowledgeCenterCaseCard({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xff111111),
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        border: Border.all(
          color: const Color(0xff1d1d1d),
          width: 4,
        ),
      ),
      child: child,
    );
  }
}
