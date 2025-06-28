import 'package:flutter/material.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  String selectedCategory = 'All';

  final List<Map<String, dynamic>> categories = [
    {
      "title": "Creative Corner",
      "desc": "Arts, DIYs, and activities",
      "icon": Icons.palette,
      "type": "Arts",
    },
    {
      "title": "Real Reads",
      "desc": "Parenting guides, routines, wellness",
      "icon": Icons.book,
      "type": "Non-Fiction",
    },
    {
      "title": "Once Upon Our World",
      "desc": "Fiction stories for or by kids",
      "icon": Icons.menu_book,
      "type": "Fiction",
    },
    {
      "title": "Parenting Raw & Real",
      "desc": "Honest parenting stories & challenges",
      "icon": Icons.favorite,
      "type": "Non-Fiction",
    },
  ];

  final List<String> filterOptions = ['All', 'Arts', 'Non-Fiction', 'Fiction'];

  @override
  Widget build(BuildContext context) {
    final filtered = selectedCategory == 'All'
        ? categories
        : categories.where((c) => c['type'] == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Tiny Tales & Big Thoughts"),
        backgroundColor: Colors.deepOrange,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🔸 Gradient background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFA726), Color(0xFFF48FB1)], // Orange to soft pink
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // 🔸 Foreground content
          ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Wrap(
                spacing: 10,
                children: filterOptions.map((option) {
                  return ChoiceChip(
                    label: Text(option),
                    selected: selectedCategory == option,
                    onSelected: (_) {
                      setState(() => selectedCategory = option);
                    },
                    selectedColor: Colors.deepOrange,
                    backgroundColor: Colors.white70,
                    labelStyle: TextStyle(
                      color: selectedCategory == option ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 20),

              ...filtered.map((cat) => Card(
                    elevation: 4,
                    color: Colors.white,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: ListTile(
                      leading: Icon(cat["icon"], color: Colors.deepOrange),
                      title: Text(
                        cat["title"],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(cat["desc"]),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Opening ${cat["title"]}...")),
                        );
                      },
                    ),
                  )),

              const SizedBox(height: 30),

              // 🔸 Write With Us Section
              Card(
                color: Colors.orange[50],
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "✍️ Write with Us!",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Are you a parent or creative mind? Share your story, tips, or art with the Lil Circle community.",
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text("Submit form coming soon!")),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepOrange,
                        ),
                        child: const Text("Submit Your Story"),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      ),
    );
  }
}
