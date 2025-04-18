import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_button.dart';

class PlanActions extends StatelessWidget {
  const PlanActions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        CustomButton(
          title: "Try Now",
          onPressed: () {},
          borderRadius: 12,
          backgroundColor: Colors.transparent,
        ),
        CustomButton(
          title: "Get Started Now",
          titleColor: Colors.black,
          onPressed: () {},
          borderRadius: 12,
          backgroundColor: Colors.white,
        ),
      ],
    );
  }
}
