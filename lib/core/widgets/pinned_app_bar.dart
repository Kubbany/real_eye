import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_app_bar.dart';

class PinnedAppBar extends StatelessWidget {
  const PinnedAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Positioned(
      top: 0,
      left: 0,
      right: 0,
      child: CustomAppBar(),
    );
  }
}
