import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_gradient_header.dart';

class ContactUsTitleSection extends StatelessWidget {
  const ContactUsTitleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 40,
          ),
          CustomGradientHeader(
            title: "Contact Us",
          ),
          Text(
            "Have questions or need support? Get in touch with our team. We're here to help!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
