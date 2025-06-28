import 'package:flutter/material.dart';

class PodcastScreen extends StatefulWidget {
  const PodcastScreen({super.key});

  @override
  State<PodcastScreen> createState() => _PodcastScreenState();
}

class _PodcastScreenState extends State<PodcastScreen> {
  String selectedType = 'All';

  final List<String> types = ['All', 'Talks', 'Kids', 'Weekly', 'Experts'];
  final List<Map<String, String>> episodes = [
    {
      'title': 'Talks That Matter',
      'desc': 'Important topics for parents and kids',
      'type': 'Talks',
    },
    {
      'title': 'Kids on Mic',
      'desc': 'Fun chats with young voices',
      'type': 'Kids',
    },
    {
      'title': 'Topic of the Week',
      'desc': 'A new theme every week!',
      'type': 'Weekly',
    },
    {
      'title': 'Lil Experts',
      'desc': 'Wisdom from little geniuses',
      'type': 'Experts',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredEpisodes = selectedType == 'All'
        ? episodes
        : episodes.where((ep) => ep['type'] == selectedType).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('The Lil Humans Podcast'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Stack(
        children: [
          // Gradient Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF8E2DE2), Color(0xFFFDA085)], // Violet to Soft Pink
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildFilterChips(),
                const SizedBox(height: 16),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredEpisodes.length,
                    itemBuilder: (context, index) {
                      final ep = filteredEpisodes[index];
                      return Card(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        elevation: 4,
                        child: ListTile(
                          title: Text(ep['title']!),
                          subtitle: Text(ep['desc']!),
                          trailing: const Icon(Icons.podcasts),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Playing: ${ep['title']}'),
                              ),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 10,
      children: types.map((type) {
        return ChoiceChip(
          label: Text(type),
          selected: selectedType == type,
          onSelected: (_) {
            setState(() => selectedType = type);
          },
          selectedColor: Colors.deepPurple,
          backgroundColor: Colors.white70,
          labelStyle: TextStyle(
            color: selectedType == type ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        );
      }).toList(),
    );
  }
}
