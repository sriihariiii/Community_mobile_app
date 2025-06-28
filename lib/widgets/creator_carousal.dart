import 'package:flutter/material.dart';

class CreatorCarousel extends StatelessWidget {
  const CreatorCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> creators = [
      "👩‍🎨 Mira – DIY Queen",
      "🧑‍🏫 Arjun – Storyteller Dad",
      "👩‍🔬 Rhea – Science Mom",
    ];

    return SizedBox(
      height: 100,
      child: PageView.builder(
        itemCount: creators.length,
        controller: PageController(viewportFraction: 0.8),
        itemBuilder: (_, index) {
          return Card(
            color: Colors.amber[100],
            margin: const EdgeInsets.symmetric(horizontal: 8),
            child: Center(
              child: Text(
                creators[index],
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
