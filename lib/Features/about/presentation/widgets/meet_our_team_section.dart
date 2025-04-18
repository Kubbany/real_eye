import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/presentation/widgets/team_members_list.dart';

class MeetOurTeamSection extends StatelessWidget {
  const MeetOurTeamSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        SizedBox(
          height: 40,
        ),
        Text(
          "Meet Our Team",
          style: TextStyle(
            color: Color(0xFF1A40C4),
            fontSize: 28,
            fontWeight: FontWeight.w500,
          ),
        ),
        TeamMembersList(),
        SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
