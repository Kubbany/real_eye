import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(
          double.infinity,
          60,
        ),
        backgroundColor: Colors.blue,
      ),
      child: const Text(
        "Start For Free Today",
        style: TextStyle(
          color: Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
