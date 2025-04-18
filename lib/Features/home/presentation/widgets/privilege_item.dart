import 'package:flutter/material.dart';

class PrivilegeItem extends StatelessWidget {
  const PrivilegeItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.check_sharp),
      title: Text(
        title,
      ),
    );
  }
}
