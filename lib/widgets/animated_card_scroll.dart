import 'package:flutter/material.dart';

class ScrollCardItem {
  final String title;
  final String description;
  final String image;
  final Color backgroundColor;
  final String buttonText;

  ScrollCardItem({
    required this.title,
    required this.description,
    required this.image,
    required this.backgroundColor,
    required this.buttonText,
  });
}

class AnimatedCardScroll extends StatefulWidget {
  final String heading;
  final List<ScrollCardItem> items;

  const AnimatedCardScroll({
    super.key,
    required this.heading,
    required this.items,
  });

  @override
  State<AnimatedCardScroll> createState() => _AnimatedCardScrollState();
}

class _AnimatedCardScrollState extends State<AnimatedCardScroll> {
  final PageController _controller = PageController(viewportFraction: 0.75);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 24),
        Text(
          widget.heading,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF25396F),
          ),
        ),
        const SizedBox(height: 24),

        // 🔁 Horizontal Scroll Cards
        SizedBox(
          height: 420,
          child: PageView.builder(
            controller: _controller,
            itemCount: widget.items.length,
            onPageChanged: (index) {
              setState(() => _currentPage = index);
            },
            itemBuilder: (context, index) {
              final item = widget.items[index];
              final isSelected = index == _currentPage;

              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: isSelected ? 12 : 30,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 16),
                    // 🖼️ Image inside colored box
                    Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: item.backgroundColor,
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Center(
                        child: Image.asset(
                          item.image,
                          height: 140,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // 🧾 Title
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),

                    // 📜 Description
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                      child: Text(
                        item.description,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // 💰 CTA Button
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.monetization_on, color: Colors.white),
                        label: Text(
                          item.buttonText,
                          style: const TextStyle(color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.indigoAccent,
                          shape: const StadiumBorder(),
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
