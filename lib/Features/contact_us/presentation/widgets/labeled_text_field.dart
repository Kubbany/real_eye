import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.verticalContentPadding,
    this.keyboardType,
    this.validator,
  });
  final String label, hint;
  final double? verticalContentPadding;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        CustomTextField(
          keyboardType: keyboardType,
          validator: validator,
          hintText: hint,
          verticalContentPadding: verticalContentPadding,
        ),
      ],
    );
  }
}
