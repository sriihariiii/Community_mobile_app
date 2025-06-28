import 'package:flutter/material.dart';

class LilEndnoteFooter extends StatelessWidget {
  const LilEndnoteFooter({super.key});

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Colors.black,
      fontSize: 10, // ✅ Even smaller font
    );
    const iconSize = 14.0; // ✅ Smaller icon size
    const iconColor = Colors.black;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            runSpacing: 6,
            children: const [
              Text('What We Do', style: textStyle),
              Text('Team', style: textStyle),
              Text('Privacy', style: textStyle),
              Text('Terms', style: textStyle),
              Text('Guidelines', style: textStyle),
              Text('Sitemap', style: textStyle),
              Text('Contact', style: textStyle),
            ],
          ),
          const SizedBox(height: 12),
          const Text(
            'Follow Us',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
          ),
          const SizedBox(height: 8),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 12,
            children: const [
              Icon(Icons.camera_alt, color: iconColor, size: iconSize),       // Instagram
              Icon(Icons.alternate_email, color: iconColor, size: iconSize),  // X
              Icon(Icons.business_center, color: iconColor, size: iconSize),  // LinkedIn
              Icon(Icons.facebook, color: iconColor, size: iconSize),         // Facebook
            ],
          ),
          const SizedBox(height: 10),
          const Text(
            '© 2025 Lil Circle',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 9,
            ),
          ),
        ],
      ),
    );
  }
}
