import 'package:flutter/material.dart';

class ContentCategoryFilter extends StatelessWidget {
  final String selectedCategory;
  final ValueChanged<String> onCategorySelected;

  const ContentCategoryFilter({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  final List<String> categories = const [
    'All',
    'Arts',
    'Non-Fiction',
    'Fiction',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      children: categories.map((category) {
        final isSelected = category == selectedCategory;
        return ChoiceChip(
          label: Text(category),
          selected: isSelected,
          onSelected: (_) => onCategorySelected(category),
          selectedColor: Colors.deepPurple,
        );
      }).toList(),
    );
  }
}
