import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:real_eye/core/utils/methods/luanch_custom_url.dart';

class ClickableUrlText extends StatelessWidget {
  final String url;
  final String? prefixText;

  const ClickableUrlText({
    super.key,
    required this.url,
    this.prefixText,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          if (prefixText != null) TextSpan(text: prefixText),
          TextSpan(
            text: url,
            style: const TextStyle(
              color: Colors.blue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()..onTap = () => luanchCustomUrl(context, url),
          ),
        ],
      ),
    );
  }
}
