import 'package:flutter/material.dart';

class EventScreen extends StatelessWidget {
  const EventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> events = [
      {
        "title": "Lil Fest 2025",
        "desc": "A joyful gathering of creators, kids & ideas",
      },
      {
        "title": "Magic Story Night",
        "desc": "Live bedtime stories with our creators",
      },
      {
        "title": "Parent & Child Workshops",
        "desc": "Collaborative spaces for growth & learning",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Events & Magic Moments"),
        backgroundColor: Colors.pinkAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // ✨ Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFE040FB), Color(0xFFFFD180)], // Magenta to Peach
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
                "Step into our world of wonder and shared joy:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              ...events.map((event) => Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.event, color: Colors.pink),
                      title: Text(
                        event["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(event["desc"]!),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening "${event["title"]}"...')),
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
