import 'package:flutter/material.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/how_it_works_list.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          "How It Works",
          style: TextStyle(
            color: Color(0xFF1A40C4),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        HowItWorksList(),
      ],
    );
  }
}
