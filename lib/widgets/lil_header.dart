import 'package:flutter/material.dart';

class LilHeader extends StatelessWidget implements PreferredSizeWidget {
  const LilHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 600;

    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.black),
      title: const Text(
        'LIL CIRCLE',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
          letterSpacing: 1.2,
        ),
      ),
      centerTitle: true,
      actions: isMobile
          ? null
          : [
              _navButton('Home'),
              _navButton('About'),
              _navButton('Contact'),
              const SizedBox(width: 12),
            ],
    );
  }

  Widget _navButton(String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
