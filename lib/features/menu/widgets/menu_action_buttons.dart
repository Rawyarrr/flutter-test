import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';

class MenuActionButtons extends StatelessWidget {
  const MenuActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: _ActionButton(
              label: AppStrings.addFood,
              isFilled: true,
              onPressed: () => _showMessage(context, AppStrings.addFoodMessage),
            ),
          ),
          const SizedBox(width: 9),
          Expanded(
            child: _ActionButton(
              label: AppStrings.addCategory,
              onPressed: () =>
                  _showMessage(context, AppStrings.addCategoryMessage),
            ),
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

class _ActionButton extends StatelessWidget {
  const _ActionButton({
    required this.label,
    required this.onPressed,
    this.isFilled = false,
  });

  final String label;
  final VoidCallback onPressed;
  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 44,
      child: Material(
        color: isFilled ? AppColors.primary : AppColors.surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: const BorderSide(color: AppColors.primary, width: 1),
        ),
        child: InkWell(
          onTap: onPressed,
          borderRadius: BorderRadius.circular(5),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Text(
                    label,
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: isFilled
                          ? AppColors.surface
                          : AppColors.primaryDark,
                      fontWeight: FontWeight.w700,
                      fontSize: 11,
                    ),
                  ),
                ),
                const SizedBox(width: 9),
                _PlusBadge(isFilled: isFilled),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PlusBadge extends StatelessWidget {
  const _PlusBadge({required this.isFilled});

  final bool isFilled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 18,
      height: 18,
      decoration: BoxDecoration(
        color: isFilled ? AppColors.surface : AppColors.primary,
        shape: BoxShape.circle,
      ),
      child: Icon(
        Icons.add_rounded,
        size: 16,
        color: isFilled ? AppColors.primary : AppColors.surface,
      ),
    );
  }
}
