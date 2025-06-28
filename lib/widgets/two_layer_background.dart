import 'package:flutter/material.dart';

class TwoLayerBackground extends StatelessWidget {
  final Widget child;

  const TwoLayerBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.black, // Base layer (black)
        gradient: LinearGradient( // Top gradient layer
          colors: [
            Color(0xFF121212), // Dark grey
            Color(0xFF000000), // Pure black
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: child,
    );
  }
}
