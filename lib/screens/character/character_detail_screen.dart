import 'package:flutter/material.dart';

class CharacterDetailScreen extends StatelessWidget {
  final String name;
  final String image;
  final Color color;
  final String desc;
  final int coins;

  const CharacterDetailScreen({
    super.key,
    required this.name,
    required this.image,
    required this.color,
    required this.desc,
    required this.coins,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.withOpacity(0.1),
      appBar: AppBar(
        title: Text(name),
        backgroundColor: color,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Hero(
            tag: 'character-image-$name',
            child: Image.asset(image, height: 220),
          ),
          const SizedBox(height: 20),
          Text(
            name,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              desc,
              style: const TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: const StadiumBorder(),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 14),
            ),
            icon: const Icon(Icons.monetization_on, color: Colors.white),
            label: Text(
              '$coins Coins',
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const SizedBox(height: 40),
        ],
      ),
    );
  }
}
