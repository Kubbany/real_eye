import 'package:flutter/material.dart';
import 'package:real_eye/Features/about/domain/entities/team_member_entity.dart';

class TeamMemberItem extends StatelessWidget {
  const TeamMemberItem({super.key, required this.member});
  final TeamMemberEntity member;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ClipOval(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.5, // Diameter
            height: MediaQuery.sizeOf(context).width * 0.5,
            child: Image.asset(
              member.image,
              fit: BoxFit.fill,
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          member.name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const Text(
          "Software Engineer",
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
