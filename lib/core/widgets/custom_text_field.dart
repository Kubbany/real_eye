import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.keyboardType,
    this.textEditingController,
    this.validator,
    this.verticalContentPadding,
    this.fillColor,
    this.borderColor,
    this.borderRadius,
  });
  final String hintText;
  final Color? fillColor, borderColor;
  final double? verticalContentPadding, borderRadius;
  final TextEditingController? textEditingController;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textEditingController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: widget.validator ??
          (value) {
            if (value == null || value.isEmpty) {
              return "This Filed Cannot Be Empty";
            }
            return null;
          },
      keyboardType: widget.keyboardType,
      textAlignVertical: widget.verticalContentPadding == null ? null : TextAlignVertical.top,
      decoration: InputDecoration(
        filled: true,
        fillColor: widget.fillColor ?? const Color(0xff101825),
        contentPadding: EdgeInsets.only(
          top: 12,
          left: 16,
          right: 16,
          bottom: widget.verticalContentPadding ?? 12,
        ),
        enabledBorder: buildBorder(
          color: widget.borderColor,
          borderRadius: widget.borderRadius,
        ),
        errorBorder: buildBorder(
          color: Colors.red,
          borderRadius: widget.borderRadius,
        ),
        focusedBorder: buildBorder(
          color: Colors.blue,
          borderRadius: widget.borderRadius,
        ),
        focusedErrorBorder: buildBorder(
          color: Colors.red,
          borderRadius: widget.borderRadius,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color, double? borderRadius}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius ?? 6),
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
      ),
    );
  }
}
