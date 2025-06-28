import 'package:flutter/material.dart';

class CreatorScreen extends StatelessWidget {
  const CreatorScreen({super.key});

  final List<Map<String, String>> creators = const [
    {
      "name": "Maya Sharma",
      "desc": "Storyteller, illustrator, and voice of Tiny Tales",
    },
    {
      "name": "Ankit Rao",
      "desc": "Science educator making Brain Snacks fun",
    },
    {
      "name": "Zara & Mom",
      "desc": "Duo behind Parenting Raw & Real series",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Creator Spotlight"),
        backgroundColor: Colors.indigo,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🎨 Indigo to Blue Gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF3F51B5), Color(0xFF2196F3)], // Indigo to Blue
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🔶 Foreground Creator Cards
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                "Meet the creative minds shaping Lil Circle:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              ...creators.map((creator) => Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.star, color: Colors.indigo),
                      title: Text(
                        creator["name"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(creator["desc"]!),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening ${creator["name"]}...')),
                        );
                      },
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
