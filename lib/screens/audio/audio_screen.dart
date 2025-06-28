import 'package:flutter/material.dart';
import 'package:lil_circle/widgets/lil_endnote_footer.dart';
import 'package:lil_circle/widgets/lil_header.dart';

class AudioScreen extends StatefulWidget {
  const AudioScreen({super.key});

  @override
  State<AudioScreen> createState() => _AudioScreenState();
}

class _AudioScreenState extends State<AudioScreen> {
  String selectedMood = 'All';

  final List<String> moods = ['All', 'Calm', 'Focus', 'Sleep'];

  final List<Map<String, dynamic>> audioTracks = [
    {
      'title': 'Bedtime Beats',
      'desc': 'Soothing sounds to help kids sleep',
      'mood': 'Sleep',
    },
    {
      'title': 'Mindful Minutes',
      'desc': 'Quick meditation tips for parents',
      'mood': 'Calm',
    },
    {
      'title': 'Brain Snacks',
      'desc': 'Fun facts and lessons for curious minds',
      'mood': 'Focus',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredTracks = selectedMood == 'All'
        ? audioTracks
        : audioTracks.where((track) => track['mood'] == selectedMood).toList();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("Lil Listens"),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Stack(
        children: [
          // 🎨 Gradient background
          const Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFB3E5FC), Color(0xFFD1C4E9)], // Soft blue → gentle purple
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),

          // 📦 Foreground content
          Column(
            children: [
              const SizedBox(height: kToolbarHeight + 24),
              const LilHeader(),

              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: _buildFilterChips(),
              ),
              const SizedBox(height: 16),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ListView.builder(
                    itemCount: filteredTracks.length,
                    itemBuilder: (context, index) {
                      final track = filteredTracks[index];
                      return Card(
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: ListTile(
                          title: Text(
                            track['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(track['desc']),
                          trailing: const Icon(Icons.play_circle_fill, color: Colors.deepPurple),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Playing: ${track['title']}')),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),

              const LilEndnoteFooter(), // Footer at bottom
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChips() {
    return Wrap(
      spacing: 10,
      children: moods.map((mood) {
        return ChoiceChip(
          label: Text(mood),
          selected: selectedMood == mood,
          selectedColor: Colors.deepPurple,
          backgroundColor: Colors.white,
          labelStyle: TextStyle(
            color: selectedMood == mood ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
          onSelected: (selected) {
            setState(() => selectedMood = mood);
          },
        );
      }).toList(),
    );
  }
}
