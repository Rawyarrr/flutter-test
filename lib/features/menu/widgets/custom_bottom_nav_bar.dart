import 'package:flutter/material.dart';

import '../../../core/constants/app_strings.dart';
import '../../../core/theme/app_colors.dart';

class CustomBottomNavBar extends StatelessWidget {
  const CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 68 + MediaQuery.paddingOf(context).bottom,
      padding: EdgeInsets.only(
        left: 35,
        right: 35,
        top: 8,
        bottom: MediaQuery.paddingOf(context).bottom,
      ),
      decoration: const BoxDecoration(
        color: AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: Offset(0, -4),
          ),
        ],
      ),
      child: const Row(
        children: [
          Expanded(child: _NavItem(icon: Icons.person_outline_rounded)),
          Expanded(
            child: _NavItem(
              icon: Icons.dinner_dining_outlined,
              label: AppStrings.menu,
              isSelected: true,
            ),
          ),
          Expanded(child: _NavItem(icon: Icons.receipt_long_outlined)),
        ],
      ),
    );
  }
}

class _NavItem extends StatelessWidget {
  const _NavItem({required this.icon, this.label, this.isSelected = false});

  final IconData icon;
  final String? label;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final color = isSelected ? AppColors.primary : AppColors.textPrimary;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color, size: 27),
        if (label != null) ...[
          const SizedBox(height: 1),
          Text(
            label!,
            style: TextStyle(
              color: color,
              fontSize: 10,
              fontWeight: FontWeight.w700,
              height: 1.2,
            ),
          ),
        ],
      ],
    );
  }
}
