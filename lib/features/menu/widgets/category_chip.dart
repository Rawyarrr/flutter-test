import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../models/category_model.dart';

class CategoryChip extends StatelessWidget {
  const CategoryChip({
    required this.category,
    required this.isSelected,
    required this.onTap,
    super.key,
  });

  final CategoryModel category;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isSelected ? AppColors.primary : AppColors.surface,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(7),
        side: BorderSide(
          color: isSelected ? AppColors.primary : AppColors.border,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(7),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                category.name,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: isSelected ? AppColors.surface : AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: 11,
                ),
              ),
              const SizedBox(width: 7),
              ClipOval(
                child: Image.network(
                  category.imageUrl,
                  width: 27,
                  height: 27,
                  fit: BoxFit.cover,
                  errorBuilder: (_, __, ___) => const SizedBox(
                    width: 27,
                    height: 27,
                    child: Icon(Icons.fastfood_rounded, size: 18),
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
