import 'package:flutter/material.dart';

class DrawerMenuIcon extends StatelessWidget {
  const DrawerMenuIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Scaffold.of(context).openDrawer();
      },
      icon: const Icon(
        Icons.menu,
        size: 30,
      ),
    );
  }
}
