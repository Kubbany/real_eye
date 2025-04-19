import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/app_images.dart';

class ImageFrame extends StatelessWidget {
  const ImageFrame({super.key, required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.1,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.25,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey.shade900,
            width: 16,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              12,
            ),
          ),
        ),
        child: Image.asset(
          Assets.imagesDeepfake,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
