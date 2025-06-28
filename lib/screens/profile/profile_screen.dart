import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Lil Space"),
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🌿 Mint Green to Light Green Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFB2F2BB), Color(0xFFD3F9D8)], // Mint → Light Green
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🌟 Foreground Content
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                "Welcome to your space in the circle!",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              _buildCard(
                icon: Icons.favorite,
                title: "Saved Content",
                subtitle: "Your liked blogs, podcasts, and videos",
              ),
              _buildCard(
                icon: Icons.settings,
                title: "Preferences",
                subtitle: "Manage your moods, filters, and themes",
              ),
              _buildCard(
                icon: Icons.account_circle,
                title: "Your Profile",
                subtitle: "View and edit your profile info",
              ),
              _buildCard(
                icon: Icons.notifications,
                title: "Notifications",
                subtitle: "Manage your alerts and reminders",
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCard({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Add navigation or interactivity here
        },
      ),
    );
  }
}
