import 'package:flutter/material.dart';
import 'package:real_eye/core/widgets/custom_password_field.dart';
import 'package:real_eye/core/widgets/custom_text_field.dart';

class LabeledTextField extends StatelessWidget {
  const LabeledTextField({
    super.key,
    required this.label,
    required this.hint,
    this.verticalContentPadding,
    this.keyboardType,
    this.validator,
    this.isPasswordField = false,
    this.textEditingController,
  });
  final String label, hint;
  final TextEditingController? textEditingController;
  final double? verticalContentPadding;
  final bool isPasswordField;
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
        isPasswordField
            ? CustomPasswordField(
                textEditingController: textEditingController,
                fillColor: Colors.grey[800],
                validator: validator,
                hintText: hint,
              )
            : CustomTextField(
                textEditingController: textEditingController,
                keyboardType: keyboardType,
                fillColor: Colors.grey[800],
                validator: validator,
                hintText: hint,
                verticalContentPadding: verticalContentPadding,
              ),
      ],
    );
  }
}
