import 'package:flutter/material.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/continue_with_list.dart';

class ContinueWithSection extends StatelessWidget {
  const ContinueWithSection({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          height: 25,
        ),
        const ContinueWithList(),
      ],
    );
  }
}
