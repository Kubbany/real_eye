import 'package:flutter/material.dart';
import 'package:real_eye/Features/home/presentation/widgets/privilege_item.dart';

class PlanPrivileges extends StatelessWidget {
  const PlanPrivileges({
    super.key,
    required this.titles,
  });

  final List<String> titles;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        titles.length,
        (e) => PrivilegeItem(
          title: titles[e],
        ),
      ),
    );
  }
}
