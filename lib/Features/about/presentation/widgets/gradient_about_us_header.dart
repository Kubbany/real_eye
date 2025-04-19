import 'package:flutter/material.dart';

class GradientHeader extends StatelessWidget {
  const GradientHeader({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [Colors.grey.shade100, Colors.grey.shade600],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 60,
          fontWeight: FontWeight.bold,
          color: Colors.white, // Required for ShaderMask to work
          shadows: [
            Shadow(
              blurRadius: 4,
              offset: const Offset(1, 1),
              color: Colors.black.withAlpha(102),
            ),
          ],
        ),
      ),
    );
  }
}
