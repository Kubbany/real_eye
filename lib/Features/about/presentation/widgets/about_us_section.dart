import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/presentation/widgets/gradient_about_us_header.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          GradientHeader(
            title: "About Us",
          ),
          Text(
            "Empowering truth in digital media. Our AI-Driven platform ensures authentecity by detecting deepfakes with cutting-edge technology",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 19,
            ),
          ),
        ],
      ),
    );
  }
}
