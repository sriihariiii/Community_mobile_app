import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _controller = TextEditingController();
  String query = "";

  final Map<String, String> searchRoutes = {
    "Tiny Tales & Big Thoughts": "/blog",
    "Lil Listens": "/audio",
    "Lil Humans Podcast": "/podcast",
    "Lil Screens": "/video",
    "Lil Learning Lab": "/courses",
    "Events & Magic Moments": "/events",
    "Creator Spotlight": "/creator",
    "My Lil Space": "/profile",
  };

  @override
  Widget build(BuildContext context) {
    final results = searchRoutes.keys
        .where((title) => title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: "Search anything...",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (val) => setState(() => query = val),
            ),
            const SizedBox(height: 20),
            if (query.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: results.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: const Icon(Icons.search),
                    title: Text(results[index]),
                    onTap: () {
                      final route = searchRoutes[results[index]];
                      if (route != null) {
                        Navigator.pushNamed(context, route);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Page not found.")),
                        );
                      }
                    },
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
