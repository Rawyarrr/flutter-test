import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';
import '../../../models/food_model.dart';

class FoodCard extends StatelessWidget {
  const FoodCard({required this.food, super.key});

  final FoodModel food;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(14),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 16,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                food.imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (_, __, ___) => const ColoredBox(
                  color: Color(0xFFF1F3F2),
                  child: Center(
                    child: Icon(
                      Icons.restaurant_rounded,
                      color: AppColors.primary,
                      size: 34,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            food.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(
              context,
            ).textTheme.titleMedium?.copyWith(fontSize: 12),
          ),
          const SizedBox(height: 1),
          Text(
            food.description,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 8),
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              _Price(price: food.price),
              const Spacer(),
              _CardAction(
                icon: Icons.delete_outline_rounded,
                color: AppColors.delete,
                tooltip: AppStrings.deleteMessage,
                onPressed: () => _showMessage(
                  context,
                  '${AppStrings.deleteMessage} ${food.name}',
                ),
              ),
              const SizedBox(width: 8),
              _CardAction(
                icon: Icons.edit_outlined,
                color: AppColors.primary,
                tooltip: AppStrings.editMessage,
                onPressed: () => _showMessage(
                  context,
                  '${AppStrings.editMessage} ${food.name}',
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showMessage(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(message)));
  }
}

class _Price extends StatelessWidget {
  const _Price({required this.price});

  final String price;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Directionality(
          textDirection: TextDirection.ltr,
          child: Text(
            price,
            style: const TextStyle(
              color: AppColors.primary,
              fontSize: 12,
              height: 1,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
        const SizedBox(height: 2),
        const Text(
          AppStrings.currency,
          style: TextStyle(
            color: AppColors.textSecondary,
            fontSize: 7,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class _CardAction extends StatelessWidget {
  const _CardAction({
    required this.icon,
    required this.color,
    required this.tooltip,
    required this.onPressed,
  });

  final IconData icon;
  final Color color;
  final String tooltip;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      button: true,
      label: tooltip,
      child: InkResponse(
        onTap: onPressed,
        radius: 18,
        child: Icon(icon, size: 18, color: color),
      ),
    );
  }
}
