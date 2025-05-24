import 'package:flutter/material.dart';

class CommentItem extends StatelessWidget {
  // final String comment;

  const CommentItem({
    super.key,
    //required this.comment,
  });

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Text(
          "commentaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaasasdasdsdasdsdasdasdsdasdawdasds",
          style: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
