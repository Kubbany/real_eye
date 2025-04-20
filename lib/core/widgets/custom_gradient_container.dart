import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/methods/get_gradient_decoration.dart';
import 'package:real_eye/core/widgets/pinned_app_bar.dart';

class CustomGradientContainer extends StatelessWidget {
  const CustomGradientContainer({
    super.key,
    required this.child,
  });
  final CustomScrollView child;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Container(
            decoration: getGradientDecoration(),
            child: child,
          ),
        ),
        const PinnedAppBar(),
      ],
    );
  }
}
