import 'package:flutter/material.dart';
import '../../widgets/section_card_slider.dart';

class TinyTalesScreen extends StatelessWidget {
  const TinyTalesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F3F9),
      body: SafeArea(
        child: SectionCardSlider(
          heading: 'Tiny Tales & Big Thoughts',
          items: [
            SectionCardItem(
              title: 'Magic Forest',
              subtitle: 'A story of a brave squirrel and his forest friends.',
              image: 'assets/images/tiny_tales.png',
              backgroundColor: Colors.orangeAccent,
            ),
            SectionCardItem(
              title: 'Star Catcher',
              subtitle: 'A dreamy bedtime story across the galaxy.',
              image: 'assets/images/star.png',
              backgroundColor: Colors.deepPurpleAccent,
            ),
          ],
        ),
      ),
    );
  }
}
