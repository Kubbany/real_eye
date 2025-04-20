import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:real_eye/Features/authentication/presentation/widgets/continue_with_item.dart';

class ContinueWithList extends StatelessWidget {
  const ContinueWithList({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        ContinueWithItem(
          icon: FontAwesomeIcons.github,
        ),
        ContinueWithItem(
          icon: FontAwesomeIcons.facebookF,
        ),
        ContinueWithItem(
          icon: FontAwesomeIcons.linkedinIn,
        ),
      ],
    );
  }
}
