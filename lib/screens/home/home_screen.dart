import 'package:flutter/material.dart';
import 'package:lil_circle/widgets/lil_header.dart';
import 'package:lil_circle/widgets/lil_endnote_footer.dart';
import 'package:lil_circle/widgets/lil_drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  String _hoveredCard = '';

  /* ‑‑‑ card data ‑‑‑ */
  final List<Map<String, dynamic>> sections = [
    {
      'title': 'Tiny Tales & Big Thoughts',
      'subtitle': 'Short, inspiring stories',
      'image': 'assets/images/tiny_tales.png',
      'route': '/blog',
      'gradient': [Color(0xFFB3E5FC), Color(0xFF81D4FA)],          // light‑blue
    },
    {
      'title': 'Lil Listens',
      'subtitle': 'Calming audio & tips',
      'image': 'assets/images/lil_listens.png',
      'route': '/audio',
      'gradient': [Color(0xFFD2B48C), Color(0xFFBC8F8F)],          // peanut brown
    },
    {
      'title': 'Lil Humans Podcast',
      'subtitle': 'Weekly kid‑friendly talks',
      'image': 'assets/images/lil_podcast.png',
      'route': '/podcast',
      'gradient': [Color(0xFFB0C4DE), Color(0xFF3B5998)],          // light navy
    },
    {
      'title': 'Lil Screens',
      'subtitle': 'Playful animations',
      'image': 'assets/images/lil_screens.png',
      'route': '/video',
      'gradient': [Color(0xFFFFE0E0), Color(0xFFFFC0CB)],          // pinkish
    },
    {
      'title': 'Lil Learning Lab',
      'subtitle': 'Curious learning',
      'image': 'assets/images/lil_learning.png',
      'route': '/courses',
      'gradient': [Color(0xFF1A237E), Color(0xFF0D47A1)],          // navy blue
    },
    {
      'title': 'Events & Magic Moments',
      'subtitle': 'Live & local fun',
      'image': 'assets/images/events.png',
      'route': '/events',
      'gradient': [Color(0xFFD2B48C), Color(0xFFCD853F)],          // light brown
    },
    {
      'title': 'Creator Spotlight',
      'subtitle': 'Featured talents',
      'image': 'assets/images/creator.png',
      'route': '/creator',
      'gradient': [Color(0xFFA8E6CF), Color(0xFF00C853)],          // green
    },
    {
      'title': 'My Lil Space',
      'subtitle': 'Your creative corner',
      'image': 'assets/images/profile.png',
      'route': '/profile',
      'gradient': [Color(0xFFE0E0E0), Color(0xFF9E9E9E)],          // grey
    },
  ];

  /* =========  UI  ========= */
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const LilDrawer(),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset('assets/images/background.png', fit: BoxFit.cover),
          ),
          Column(
            children: [
              const LilHeader(),
const SizedBox(height: 80), // push section lower
Expanded(
  child: Column(
    children: [
      const Spacer(flex: 2), // more space above scroll strip
      SizedBox(
        height: 260,
        child: ListView.builder(
          controller: _scrollController,
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          clipBehavior: Clip.none,
          itemCount: sections.length,
          itemBuilder: (ctx, i) {
            final s = sections[i];
            return _buildCard(
              ctx,
              title:     s['title'],
              subtitle:  s['subtitle'],
              image:     s['image'],
              route:     s['route'],
              gradient:  List<Color>.from(s['gradient']),
            );
          },
        ),
      ),
      const Spacer(flex: 2),
    ],
  ),
),
              const LilEndnoteFooter(),                   // pinned footer
            ],
          ),
        ],
      ),
    );
  }

  /* =========  card widget  ========= */
  Widget _buildCard(
    BuildContext ctx, {
    required String title,
    required String subtitle,
    required String image,
    required String route,
    required List<Color> gradient,
  }) {
    final bool isHovered = _hoveredCard == title;

    return MouseRegion(
      onEnter: (_) => setState(() => _hoveredCard = title),
      onExit:  (_) => setState(() => _hoveredCard = ''),
      child: GestureDetector(
        onTap: () => Navigator.pushNamed(ctx, route),
        child: Container(
          width: 220,
          height: 260,
          margin: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isHovered ? 0.35 : 0.15),
                blurRadius: isHovered ? 14 : 6,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          clipBehavior: Clip.none,
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              /* gradient + text */
              Column(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius:
                          const BorderRadius.vertical(top: Radius.circular(20)),
                    ),
                  ),
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: gradient,
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(20)),
                    ),
                    child: AnimatedScale(
                      scale: isHovered ? 1.12 : 1.0,
                      duration: const Duration(milliseconds: 250),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 2),
                          Text(
                            subtitle,
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /* popping cartoon image */
              AnimatedPositioned(
                duration: const Duration(milliseconds: 250),
                top: isHovered ? -60 : -20,
                child: AnimatedScale(
                  scale: isHovered ? 1.25 : 1.0,
                  duration: const Duration(milliseconds: 250),
                  child: Image.asset(
                    image,
                    height: isHovered ? 220 : 140,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
