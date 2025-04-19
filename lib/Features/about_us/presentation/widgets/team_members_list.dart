import 'package:flutter/material.dart';
import 'package:real_eye/Features/about_us/domain/entities/team_member_entity.dart';
import 'package:real_eye/Features/about_us/presentation/widgets/team_member_item.dart';
import 'package:real_eye/core/utils/app_images.dart';

class TeamMembersList extends StatelessWidget {
  const TeamMembersList({super.key});
  static const List<TeamMemberEntity> teamMembers = [
    TeamMemberEntity(image: Assets.imagesAbdullah, name: "Abdullah Gamal"),
    TeamMemberEntity(image: Assets.imagesTojo, name: "Abdulrahman Tarek"),
    TeamMemberEntity(image: Assets.imagesQabany, name: "Abdulrahman Hassan"),
    TeamMemberEntity(image: Assets.imagesZiad, name: "Ziad Mohamed"),
    TeamMemberEntity(image: Assets.imagesFahd, name: "Mohamed Fahd"),
    TeamMemberEntity(image: Assets.imagesHesham, name: "Abdulrahman Hesham"),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        teamMembers.length,
        (e) => Padding(
          padding: const EdgeInsets.only(
            top: 30,
          ),
          child: TeamMemberItem(
            member: teamMembers[e],
          ),
        ),
      ),
    );
  }
}
