import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/presentation/widgets/about_us_view_body.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0a0a0a),
      body: AboutUsViewBody(),
    );
  }
}
