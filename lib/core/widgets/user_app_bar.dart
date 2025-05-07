import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        left: 16,
        top: 20,
      ),
      alignment: Alignment.centerLeft,
      width: double.infinity,
      color: Colors.black,
      height: 56,
      child: IconButton(
        onPressed: () {
          Scaffold.of(context).openDrawer();
        },
        icon: const Icon(
          Icons.menu,
          size: 30,
        ),
      ),
    );
  }
}
