import 'dart:ui';

import 'package:flutter/material.dart';

class BluredAppBar extends StatelessWidget {
  const BluredAppBar({
    super.key,
    required this.child,
  });
  final Widget child;
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
          child: child,
        ),
      ),
    );
  }
}
