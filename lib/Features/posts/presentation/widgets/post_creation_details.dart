import 'package:flutter/material.dart';

class PostCreationDetails extends StatelessWidget {
  const PostCreationDetails({
    super.key,
    required this.timeAgo,
  });

  final String timeAgo;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: 22,
          backgroundColor: Colors.blue,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: Color(0xff111111),
            child: Icon(
              Icons.person,
              size: 25,
              color: Colors.blue,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'AnonymousUser',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              'Posted $timeAgo',
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
