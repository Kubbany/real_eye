import 'package:flutter/material.dart';

class AboutUsSection extends StatelessWidget {
  const AboutUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 40,
          ),
          Text(
            "About Us",
            style: TextStyle(
              fontSize: 56,
              color: Colors.grey.shade400,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
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
