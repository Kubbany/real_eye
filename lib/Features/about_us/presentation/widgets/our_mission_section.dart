import 'package:flutter/material.dart';

class OurMissionSection extends StatelessWidget {
  const OurMissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Text(
            "Our Mission",
            style: TextStyle(
              fontSize: 32,
              color: Color(0xff24398e),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "In an era where digital content can be easily manipulated, our mission is to empower individuals with AI-driven protection. We provide cutting-edge deepfake detection technology that helps users identify altered images, verify authenticity, and safeguard their digital presence.",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
