import 'package:flutter/material.dart';

BoxDecoration getGradientDecoration() {
  return BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        Colors.black,
        Colors.grey.shade900,
        Colors.black,
      ],
    ),
  );
}
