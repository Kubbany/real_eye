import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/app_images.dart';

class DeepfakeFrame extends StatelessWidget {
  const DeepfakeFrame({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.5,
      child: Container(
        padding: const EdgeInsets.all(4),
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(
            color: Colors.grey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(16), // smooth rounded corners
        ),
        child: Image.asset(
          Assets.imagesDeepfake, // <-- your image path here
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
