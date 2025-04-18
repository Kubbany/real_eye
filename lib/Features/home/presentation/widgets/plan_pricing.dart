import 'package:flutter/material.dart';

class PlanPricing extends StatelessWidget {
  const PlanPricing({super.key, required this.planType, required this.price});
  final String planType, price;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          planType,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "\$$price",
          style: const TextStyle(
            fontSize: 56,
            fontWeight: FontWeight.w900,
          ),
        ),
      ],
    );
  }
}
