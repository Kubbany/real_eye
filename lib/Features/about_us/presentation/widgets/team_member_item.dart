import 'package:flutter/material.dart';
import 'package:real_eye/Features/about_us/domain/entities/team_member_entity.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/custom_avatar.dart';

class TeamMemberItem extends StatelessWidget {
  const TeamMemberItem({super.key, required this.member});
  final TeamMemberEntity member;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        CustomAvatar(memberImage: member.image),
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
