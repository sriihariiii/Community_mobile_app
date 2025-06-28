import 'package:flutter/material.dart';
import 'package:lil_circle/widgets/lil_endnote_footer.dart';

class LilScaffold extends StatelessWidget {
  final String title;
  final Widget child;

  const LilScaffold({
    super.key,
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        backgroundColor: Colors.deepPurple,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {}, // Add search logic
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {}, // Navigate to store
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(child: child),
          const LilEndnoteFooter(),
        ],
      ),
    );
  }
}
