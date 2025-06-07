import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ClickableUrlText extends StatelessWidget {
  final String? url;

  const ClickableUrlText({
    super.key,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(text: 'Fake Frames Zip: '),
          TextSpan(
            text: url != null ? Uri.parse(url!).host : 'Not available',
            style: TextStyle(
              color: url != null ? Colors.blue : Colors.grey,
              decoration: url != null ? TextDecoration.underline : TextDecoration.none,
            ),
            recognizer: url != null
                ? (TapGestureRecognizer()
                  ..onTap = () => launchUrl(
                        Uri.parse(url!),
                      ))
                : null,
          ),
        ],
      ),
    );
  }
}
