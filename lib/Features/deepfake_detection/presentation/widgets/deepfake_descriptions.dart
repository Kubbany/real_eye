import 'package:flutter/material.dart';

class DeepfakeDescriptions extends StatelessWidget {
  const DeepfakeDescriptions({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        Text(
          'Experience a cutting-edge AI-driven platform for detecting deepfakes with unparalleled accuracy. Simply upload an image or provide a link, and our advanced system will analyze pixel inconsistencies...',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 16,
        ),
        Text(
          'Leveraging a multi-layer detection approach, our technology ensures a comprehensive analysis by examining image patterns, compression artifacts, and deep learning markers, helping you distinguish real content from manipulated media effortlessly.',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
