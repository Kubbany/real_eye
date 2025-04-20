import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.isPasswordField = false,
    this.keyboardType,
    this.textEditingController,
    this.validator,
    this.verticalContentPadding,
    this.fillColor,
  });
  final String hintText;
  final bool isPasswordField;
  final Color? fillColor;
  final double? verticalContentPadding;
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
      obscureText: widget.isPasswordField ? !isVisible : false,
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
        enabledBorder: buildBorder(),
        errorBorder: buildBorder(color: Colors.red),
        focusedBorder: buildBorder(
          color: Colors.blue,
        ),
        focusedErrorBorder: buildBorder(
          color: Colors.red,
        ),
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
        suffixIcon: widget.isPasswordField == false
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
                icon: Icon(
                  isVisible != true ? Icons.visibility_off : Icons.visibility,
                ),
              ),
      ),
    );
  }

  OutlineInputBorder buildBorder({Color? color}) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(6),
      borderSide: BorderSide(
        color: color ?? Colors.transparent,
      ),
    );
  }
}
