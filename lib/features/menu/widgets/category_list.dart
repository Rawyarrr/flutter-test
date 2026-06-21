import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/menu_provider.dart';
import 'category_chip.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<MenuProvider>();

    return SizedBox(
      height: 42,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: provider.categories.length,
        separatorBuilder: (_, __) => const SizedBox(width: 9),
        itemBuilder: (context, index) {
          final category = provider.categories[index];
          return CategoryChip(
            category: category,
            isSelected: category.id == provider.selectedCategory,
            onTap: () => provider.selectCategory(category.id),
          );
        },
      ),
    );
  }
}
