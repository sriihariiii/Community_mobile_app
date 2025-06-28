import 'package:flutter/material.dart';

class LilDrawer extends StatelessWidget {
  const LilDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black87,
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 16),
        children: [
          const Text(
            'LIL CIRCLE',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 30),

          // 🔹 Navigation Links
          _buildDrawerItem(context, 'Home', '/'),
          _buildDrawerItem(context, 'Lil Store', '/store'),
          _buildDrawerItem(context, 'Events and Courses', '/events'),
          _buildDrawerItem(context, 'Search / Find Anything', '/search'),

          const Divider(color: Colors.white30, thickness: 1, height: 32),

          // 🔹 Join / Login
          _buildDrawerItem(context, 'Join the Lil Circle', '/login'),
        ],
      ),
    );
  }

  // 🔹 Reusable Drawer Navigation Item
  Widget _buildDrawerItem(BuildContext context, String title, String route) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 4.0),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
      onTap: () {
        Navigator.pop(context); // Close the drawer
        Navigator.pushNamed(context, route); // Navigate
      },
    );
  }
}
