import 'package:flutter/material.dart';

class CustomLogoutButton extends StatelessWidget {
  const CustomLogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ElevatedButton.icon(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF3D5AFE), // Blue logout button
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 50),
        ),
        icon: const Icon(
          Icons.logout,
          color: Colors.white,
          size: 25,
        ),
        label: const Text(
          'Logout',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
