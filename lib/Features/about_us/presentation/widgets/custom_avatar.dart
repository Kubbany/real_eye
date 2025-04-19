import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  const CustomAvatar({
    super.key,
    required this.memberImage,
  });

  final String memberImage;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.5,
        height: MediaQuery.sizeOf(context).width * 0.5,
        child: Image.asset(
          memberImage,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
