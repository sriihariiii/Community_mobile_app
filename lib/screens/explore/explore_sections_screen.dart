import 'package:flutter/material.dart';

class ExploreSectionsScreen extends StatelessWidget {
  const ExploreSectionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController _controller = PageController(viewportFraction: 0.85);

    final List<Map<String, dynamic>> sections = [
      {
        "title": "Tiny Tales & Big Thoughts",
        "description": "Stories, parenting thoughts, and creativity",
        "image": "assets/images/section1.jpg", // Add matching assets
        "route": "/blog",
      },
      {
        "title": "Lil Listens",
        "description": "Relaxing audio, beats and bedtime stories",
        "image": "assets/images/section2.jpg",
        "route": "/audio",
      },
      {
        "title": "Lil Humans Podcast",
        "description": "Real conversations with and for kids",
        "image": "assets/images/section3.jpg",
        "route": "/podcast",
      },
      {
        "title": "Lil Screens",
        "description": "Handpicked videos and shorts for young minds",
        "image": "assets/images/section4.jpg",
        "route": "/video",
      },
      {
        "title": "Learning Lab",
        "description": "Explore interactive learning, fun & more",
        "image": "assets/images/section5.jpg",
        "route": "/courses",
      },
      {
        "title": "Events & Magic Moments",
        "description": "Discover upcoming events and workshops",
        "image": "assets/images/section6.jpg",
        "route": "/events",
      },
      {
        "title": "My Lil Space",
        "description": "Personalized space for your growth journey",
        "image": "assets/images/section7.jpg",
        "route": "/profile",
      },
      {
        "title": "Creator Spotlight",
        "description": "See featured creators and voices",
        "image": "assets/images/section8.jpg",
        "route": "/creator",
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView.builder(
        controller: _controller,
        itemCount: sections.length,
        itemBuilder: (context, index) {
          final item = sections[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 50),
            child: GestureDetector(
              onTap: () => Navigator.pushNamed(context, item['route']),
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(item['image']),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.4),
                      BlendMode.darken,
                    ),
                  ),
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      spreadRadius: 2,
                      offset: Offset(2, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          item['title'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          item['description'],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.8),
                            foregroundColor: Colors.deepPurple,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () => Navigator.pushNamed(context, item['route']),
                          icon: const Icon(Icons.arrow_forward),
                          label: const Text("Explore"),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
