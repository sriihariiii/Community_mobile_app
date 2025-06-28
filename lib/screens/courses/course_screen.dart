import 'package:flutter/material.dart';

class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> learningItems = [
      {
        "title": "Mini Science Labs",
        "desc": "Fun experiments for curious minds",
      },
      {
        "title": "Little Learners",
        "desc": "Basic concepts for early learners",
      },
      {
        "title": "Parent Power-Ups",
        "desc": "Guides for effective at-home learning",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lil Learning Lab"),
        backgroundColor: Colors.orange[800],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🌟 Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFF176), Color(0xFFFF9800)], // Yellow to Orange
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
                "Explore hands-on learning and discovery:",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              ...learningItems.map((item) => Card(
                    color: Colors.white,
                    elevation: 4,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: const Icon(Icons.lightbulb, color: Colors.orange),
                      title: Text(
                        item["title"]!,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(item["desc"]!),
                      trailing: const Icon(Icons.school, color: Colors.orange),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Opening "${item["title"]}"...')),
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
