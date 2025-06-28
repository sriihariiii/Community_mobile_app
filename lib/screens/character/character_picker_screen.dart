import 'package:flutter/material.dart';
import 'character_detail_screen.dart';

class CharacterPickerScreen extends StatefulWidget {
  const CharacterPickerScreen({super.key});

  @override
  State<CharacterPickerScreen> createState() => _CharacterPickerScreenState();
}

class _CharacterPickerScreenState extends State<CharacterPickerScreen> {
  final PageController _pageController = PageController(viewportFraction: 0.75);
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> characters = [
    {
      'name': 'Kenjiro',
      'desc': 'Enigmatic explorer guiding metaverse adventures.',
      'coins': 1240,
      'color': Colors.orangeAccent,
      'image': 'assets/images/tiny_tales.png',
    },
    {
      'name': 'Yuki',
      'desc': 'Bright coder with limitless imagination.',
      'coins': 890,
      'color': Colors.lightBlue,
      'image': 'assets/images/star.png',
    },
    {
      'name': 'Arlo',
      'desc': 'Curious mind of the future tech.',
      'coins': 960,
      'color': Colors.brown,
      'image': 'assets/images/arlo.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEEF1F9),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 24,
                    child: Icon(Icons.person, color: Colors.white),
                  ),
                  Row(
                    children: const [
                      Icon(Icons.monetization_on, color: Colors.amber, size: 24),
                      SizedBox(width: 6),
                      Text('3,100',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Hand-pick Your\nCharacter',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Color(0xFF25396F),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    'Explore',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: Text(
                    'View More',
                    style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            /// Character Cards
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: characters.length,
                onPageChanged: (index) => setState(() {
                  _selectedIndex = index;
                }),
                itemBuilder: (context, index) {
                  final char = characters[index];
                  final isSelected = index == _selectedIndex;

                  return AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: isSelected ? 0 : 30),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(
                          color: isSelected ? Colors.black26 : Colors.black12,
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        )
                      ],
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CharacterDetailScreen(
                              name: char['name'],
                              image: char['image'],
                              color: char['color'],
                              desc: char['desc'],
                              coins: char['coins'],
                            ),
                          ),
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: char['color'],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Center(
                                child: Hero(
                                  tag: 'character-image-${char['name']}',
                                  child: Image.asset(
                                    char['image'],
                                    fit: BoxFit.contain,
                                    height: 150,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            char['name'],
                            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                            child: Text(
                              char['desc'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                shape: const StadiumBorder(),
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => CharacterDetailScreen(
                                      name: char['name'],
                                      image: char['image'],
                                      color: char['color'],
                                      desc: char['desc'],
                                      coins: char['coins'],
                                    ),
                                  ),
                                );
                              },
                              icon: const Icon(Icons.monetization_on, color: Colors.white),
                              label: Text(
                                char['coins'].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
