import 'package:flutter/material.dart';

class CustomHomeButton extends StatelessWidget {
  const CustomHomeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(999),
        boxShadow: [
          BoxShadow(
            color: Colors.white.withAlpha(100), // Light shadow color
            offset: const Offset(0, -3), // Moves shadow to top
            blurRadius: 1,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(
            double.infinity,
            60,
          ),
          backgroundColor: const Color(0xff1f1f1f),
        ),
        child: Text(
          "Start  For  Free  Today",
          style: TextStyle(
            color: Colors.grey[700],
            fontSize: 23,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
