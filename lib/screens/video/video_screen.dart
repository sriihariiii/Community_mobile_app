import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  const VideoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> screenContent = [
      {
        "title": "Lil Explorers",
        "desc": "Fun short films and animated stories",
      },
      {
        "title": "Giggle Time",
        "desc": "Laugh-out-loud sketches for kids",
      },
      {
        "title": "Parent Picks",
        "desc": "Curated screen-time content for families",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lil Screens"),
        backgroundColor: Colors.teal[700],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🔵 Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF00897B), Color(0xFF00ACC1)], // Teal to Deep Cyan
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Foreground content
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                "Discover screen content for little minds:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              ...screenContent.map((video) => Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.tv, color: Colors.teal),
                      title: Text(
                        video["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(video["desc"]!),
                      trailing: const Icon(Icons.play_circle_fill, color: Colors.teal),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Launching "${video["title"]}"...'),
                          ),
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
