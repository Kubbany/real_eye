import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:real_eye/core/utils/app_router.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Text(
              'Our Pages',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () => GoRouter.of(context).go(
              AppRouter.kHomeView,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About Us'),
            onTap: () => GoRouter.of(context).go(
              AppRouter.kAboutUsView,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.phone),
            title: const Text('Contact Us'),
            onTap: () => GoRouter.of(context).go(
              AppRouter.kContactUsView,
            ),
          ),
          ListTile(
            leading: const Icon(Icons.shield),
            title: const Text('DeepFake Detection'),
            onTap: () => GoRouter.of(context).go(
              AppRouter.kDeepFakeDetectionView,
            ),
          ),
        ],
      ),
    );
  }
}
