import 'package:flutter/material.dart';

class PlansTitle extends StatelessWidget {
  const PlansTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.45,
      child: Text(
        "Plans That Fit You Best",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 28,
          color: Colors.grey[400],
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
