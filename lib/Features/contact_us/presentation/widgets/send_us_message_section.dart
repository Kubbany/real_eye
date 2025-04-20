import 'package:flutter/material.dart';
import 'package:real_eye/Features/contact_us/presentation/widgets/sending_message_form.dart';

class SendUsMessageSection extends StatelessWidget {
  const SendUsMessageSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Text(
            "Send Us a Message",
            style: TextStyle(
              color: Color(0xFF1A40C4),
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SendingMessageForm(),
        ],
      ),
    );
  }
}
